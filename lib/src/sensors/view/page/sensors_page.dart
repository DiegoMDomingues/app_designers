import 'dart:io';

import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/utils/blx_sizes.dart';
import 'package:biologix_base_lib/shared/views/blx_default_page.dart';
import 'package:biologix_base_lib/shared/views/modals/blx_base_modal.dart';
import 'package:biologix_base_lib/shared/views/modals/blx_permission_modal.dart';
import 'package:biologix_base_lib/shared/views/snackbar/blx_snackbar_delegate.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_appbar.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_header_modal.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/sensors/view/cubit/bodystar/bodystar_cubit.dart';
import 'package:bxutility3/src/sensors/view/cubit/bodystar/bodystar_state.dart';
import 'package:bxutility3/src/sensors/view/cubit/oxistar/oxistar_cubit.dart';
import 'package:bxutility3/src/sensors/view/cubit/oxistar/oxistar_state.dart';
import 'package:bxutility3/src/sensors/view/widgets/bodystar_card.dart';
import 'package:bxutility3/src/sensors/view/widgets/choose_bodystar.dart';
import 'package:bxutility3/src/sensors/view/widgets/choose_oxistar.dart';
import 'package:bxutility3/src/sensors/view/widgets/oxistar_card.dart';
import 'package:bxutility3/src/shared/utils/blx_images_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Tela inicial: ponto de partida para os experimentos de design.
///
/// Mostra um cartão para cada sensor. Ao ligar o cartão, o app pede a
/// permissão de Bluetooth (se faltar), procura o sensor e conecta. Com mais de
/// um sensor por perto, abre a lista para escolher. Conectado, o cartão mostra
/// os valores ao vivo (Oxistar: SpO2, frequência cardíaca e curva de pulso;
/// Bodystar: posição do corpo).
///
/// Toda a lógica de conexão está nos cubits (OxistarCubit e BodystarCubit).
/// Esta tela só desenha o estado deles, então pode ser redesenhada à vontade.
class SensorsPage extends StatefulWidget {
  const SensorsPage({super.key});

  @override
  State<SensorsPage> createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  final _oxistarCubit = inject<OxistarCubit>();
  final _bodystarCubit = inject<BodystarCubit>();

  @override
  void initState() {
    super.initState();
    _oxistarCubit.init(
      snackbar: BLXSnackbarDelegateImpl.of(context),
      showModalSelectDevice: (devices) async {
        await _showChooser(
          ChooseOxistar(
            cubit: _oxistarCubit,
            onClose: () => Navigator.pop(context),
          ),
        );
        if (_oxistarCubit.state.selectedDevice == null) {
          _oxistarCubit.resetState();
        }
      },
    );
    _bodystarCubit.init(
      snackbar: BLXSnackbarDelegateImpl.of(context),
      showModalSelectDevice: (devices) async {
        await _showChooser(
          ChooseBodystar(
            cubit: _bodystarCubit,
            onClose: () => Navigator.pop(context),
          ),
        );
        if (_bodystarCubit.state.selectedDevice == null) {
          _bodystarCubit.resetState();
        }
      },
    );
  }

  @override
  void dispose() {
    _oxistarCubit.terminate();
    _bodystarCubit.terminate();
    super.dispose();
  }

  /// Lista para escolher o sensor quando há mais de um por perto.
  Future<void> _showChooser(Widget child) {
    return showBLXBottomSheet(
      context: context,
      builder: (context) => BLXBaseModal(
        maxHeight:
            MediaQuery.of(context).size.height * 0.9 +
            MediaQuery.of(context).viewPadding.bottom,
        child: child,
      ),
    );
  }

  /// Procura o sensor; se a permissão de Bluetooth foi negada de vez, mostra
  /// o aviso que leva para as configurações do celular.
  void _connect({
    required int permission,
    required VoidCallback onScanDevice,
    required VoidCallback onOpenSettings,
  }) {
    if (permission == DeviceManager.permissionDeniedForever) {
      showBLXBottomSheet(
        context: context,
        builder: (context) => BLXPermissionModal(
          title: _oxistarCubit.state.bleDisabled,
          image: Platform.isIOS ? BLXImagesSVG.bluetooth : BLXImagesSVG.nearby,
          description: Platform.isIOS
              ? t.need_bluetooth_ios
              : _oxistarCubit.state.bleDisabledMsg,
          onConfigTap: onOpenSettings,
        ),
      );
    } else {
      onScanDevice();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BLXDefaultPage(
      titleAppbar: 'Sensores',
      appBar: const BLXAppBar(title: 'Sensores'),
      content: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(BLXSpacing.s2),
          children: [
            BlocBuilder<OxistarCubit, OxistarState>(
              bloc: _oxistarCubit,
              builder: (context, state) => OxistarCard(
                scanDevice: state.selectedDevice,
                oxistarPayloadState: state.oxistarPayloadState,
                serialNumber: state.serialNumber,
                fwVersion: state.fwVersion,
                plethData: state.plethData,
                connectionStatus: state.connStatusDevice,
                isSelected: _oxistarCubit.isConnectedOrConnecting,
                onDeviceActive: (active) {
                  if (active) {
                    _connect(
                      permission: state.permission,
                      onScanDevice: _oxistarCubit.scanDevice,
                      onOpenSettings: _oxistarCubit.openSettings,
                    );
                  } else {
                    _oxistarCubit.resetState();
                  }
                },
              ),
            ),
            const SizedBox(height: BLXSpacing.s2),
            BlocBuilder<BodystarCubit, BodystarState>(
              bloc: _bodystarCubit,
              builder: (context, state) => BodystarCard(
                scanDevice: state.selectedDevice,
                bodystarPayloadState: state.bodystarPayloadState,
                serialNumber: state.serialNumber,
                fwVersion: state.fwVersion,
                bodyPosition: _bodystarCubit.bodyPositionLabel(),
                iconPosition: _bodystarCubit.iconPosition(),
                connectionStatus: state.connStatusDevice,
                isSelected: _bodystarCubit.isConnectedOrConnecting,
                onDeviceActive: (active) {
                  if (active) {
                    _connect(
                      permission: state.permission,
                      onScanDevice: _bodystarCubit.scanDevice,
                      onOpenSettings: _bodystarCubit.openSettings,
                    );
                  } else {
                    _bodystarCubit.resetState();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
