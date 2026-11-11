import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/shared/utils/blx_sizes.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_colors.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_typography.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_radio.dart';
import 'package:bxutility3/i18n/strings.g.dart';
import 'package:bxutility3/src/sensors/view/cubit/oxistar/oxistar_cubit.dart';
import 'package:bxutility3/src/shared/utils/blx_images_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

// coverage:ignore-file
class ChooseOxistar extends StatelessWidget {
  const ChooseOxistar({super.key, required OxistarCubit cubit, this.onClose})
    : _cubit = cubit;

  final OxistarCubit _cubit;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BLXSpacing.s2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            t.widgets.choose_oxistar.title,
            style: BLXTypography.heading.m.copyWith(
              color: BLXColors.of(context).content.highlight,
            ),
          ),
          const SizedBox(height: BLXSpacing.s2),
          Text(
            t.widgets.choose_oxistar.subtitle,
            style: BLXTypography.paragraph.m.copyWith(
              color: BLXColors.of(context).content.hight,
            ),
          ),
          const SizedBox(height: BLXSpacing.s2),
          Text(
            t.widgets.choose_oxistar.description,
            style: BLXTypography.paragraph.m.copyWith(
              color: BLXColors.of(context).content.hight,
            ),
          ),
          const SizedBox(height: BLXSpacing.s2),
          ..._cubit.state.devices.map(
            (device) => Padding(
              padding: const EdgeInsets.only(bottom: BLXSpacing.s1),
              child: BLXRadio<OxistarScanDevice>(
                color: BLXColors.of(context).surface.hight,
                title: Row(
                  children: [
                    SvgPicture.asset(BLXImagesSVG.sensor),
                    const SizedBox(width: BLXSpacing.s1),
                    Text(
                      device.name,
                      style: BLXTypography.label.l.copyWith(
                        color: BLXColors.of(context).content.highlight,
                      ),
                    ),
                  ],
                ),
                value: device,
                groupValue: _cubit.state.selectedDevice,
                onChanged: (devi) {
                  if (devi != null) _cubit.chooseDevice(devi);
                  onClose?.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
