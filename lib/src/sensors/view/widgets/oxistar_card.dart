import 'dart:async';

import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/i18n/strings.g.dart';
import 'package:bxutility3/i18n/strings.g.dart' as app;
import 'package:biologix_base_lib/shared/utils/blx_images_svg_lib.dart';
import 'package:biologix_base_lib/shared/utils/blx_sizes.dart';
import 'package:biologix_base_lib/shared/utils/semantic_label_utils.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_colors.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_typography.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_alert.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_card.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_sensor_data.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_switch.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_text.dart';
import 'package:biologix_base_lib/shared/views/widgets/pleth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OxistarCard extends StatefulWidget {
  const OxistarCard({
    required this.onDeviceActive,
    this.scanDevice,
    this.oxistarPayloadState,
    this.plethData,
    this.isSelected,
    this.serialNumber,
    this.fwVersion,
    this.backgroundColor,
    this.onHasUpdate,
    this.isRecording = false,
    this.connectionStatus = DeviceConnectionStatus.notConnected,
    super.key,
  });

  final OxistarScanDevice? scanDevice;
  final OxistarPayloadState? oxistarPayloadState;
  final PlethData? plethData;
  final bool? isSelected;
  final int? serialNumber;
  final String? fwVersion;
  final Function(bool active)? onDeviceActive;
  final VoidCallback? onHasUpdate;
  final Color? backgroundColor;
  final bool isRecording;
  final DeviceConnectionStatus connectionStatus;

  @override
  State<OxistarCard> createState() => _OxistarCardState();
}

class _OxistarCardState extends State<OxistarCard> {
  bool _isSelected = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.isSelected != null) {
      setState(() {
        _isSelected = widget.isSelected!;
      });
    }
  }

  @override
  void didUpdateWidget(covariant OxistarCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != null &&
        widget.isSelected != oldWidget.isSelected) {
      setState(() {
        _isSelected = widget.isSelected!;
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  String? _textConnection() {
    switch (widget.connectionStatus) {
      case DeviceConnectionStatus.finding:
        return app.t.searching;
      case DeviceConnectionStatus.connecting:
        return t.connecting;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textConnection = _textConnection();
    final battery = widget.oxistarPayloadState?.battPercentage ?? 0;
    return IgnorePointer(
      ignoring: widget.isRecording,
      child: BLXCard(
        color: BLXColors.of(context).surface.highlight,
        colorBorder: BLXColors.of(context).semantic.errorText,
        isSelected: widget.isRecording,
        borderRadius: BorderRadius.circular(BLXBorderSize.s),
        onTap: widget.onDeviceActive != null
            ? () {
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                setState(() {
                  _isSelected = !_isSelected;
                });
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  widget.onDeviceActive!(_isSelected);
                });
              }
            : null,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        BLXImagesSVGLib.sensor,
                        excludeFromSemantics: true,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          BLXColors.of(context).content.hight,
                          BlendMode.dstIn,
                        ),
                      ),
                      const SizedBox(width: BLXSpacing.s2),
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BLXText(
                              OxistarScanDevice.nameDevice,
                              semanticsLabel:
                                  SemanticLabelUtils.removeSpecialCharacters(
                                    t.oxistar_sensor,
                                  ),
                              textAlign: TextAlign.start,
                              style: BLXTypography.heading.xs.copyWith(
                                color: BLXColors.of(context).content.hight,
                              ),
                            ),
                            if (widget.oxistarPayloadState?.battPercentage !=
                                null) ...[
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.battery_charging_full,
                                    size: 16,
                                    color: battery >= 50
                                        ? BLXColors.of(context).content.medium
                                        : BLXColors.of(
                                            context,
                                          ).semantic.errorText,
                                  ),
                                  const SizedBox(width: 6),
                                  BLXText(
                                    '$battery%',
                                    semanticsLabel: t.battery_sensor_percentage(
                                      percentage: battery,
                                    ),
                                    style: BLXTypography.label.s.copyWith(
                                      color: BLXColors.of(
                                        context,
                                      ).content.hight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (widget.onDeviceActive != null) ...[
                        BLXSwitch(
                          activeColor: BLXColors.of(context).surface.medium,
                          trackColor: BLXColors.of(context).surface.medium,
                          thumbColor: BLXColors.of(context).identity.action,
                          value: _isSelected,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce?.cancel();
                            }
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                            _debounce = Timer(
                              const Duration(milliseconds: 500),
                              () {
                                widget.onDeviceActive?.call(_isSelected);
                              },
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                if (textConnection != null)
                  BLXText(
                    textConnection,
                    style: BLXTypography.label.l.copyWith(
                      color: BLXColors.of(context).content.highlight,
                    ),
                  ),
                if (widget.oxistarPayloadState != null) ...[
                  BLXSensorData(
                    spo2:
                        widget.oxistarPayloadState!.spO2 != null &&
                            widget.oxistarPayloadState!.signalStatus == 0
                        ? '${widget.oxistarPayloadState!.spO2}'
                        : '--',
                    pleth: widget.plethData,
                    frequencyCardiac:
                        widget.oxistarPayloadState!.heartRate != null &&
                            widget.oxistarPayloadState!.signalStatus == 0
                        ? '${widget.oxistarPayloadState!.heartRate}'
                        : '--',
                  ),
                  if (widget.onHasUpdate != null) ...[
                    const SizedBox(height: BLXSpacing.s2),
                    GestureDetector(
                      onTap: widget.onHasUpdate,
                      child: BLXAlert(
                        status: BLXAlertStatus.warning,
                        title: '',
                        subTitle: t.update_sensor_avaliable,
                        direction: Axis.horizontal,
                        padding: const EdgeInsets.fromLTRB(
                          BLXSpacing.s2,
                          BLXSpacing.s1,
                          BLXSpacing.s2,
                          BLXSpacing.s1,
                        ),
                        customWidget: BLXText(
                          t.to_update,
                          style: BLXTypography.label.s.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
