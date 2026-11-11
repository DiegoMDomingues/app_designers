import 'dart:async';

import 'package:biologix_base_lib/device.dart';
import 'package:biologix_base_lib/i18n/strings.g.dart';
import 'package:bxutility3/i18n/strings.g.dart' as app;
import 'package:biologix_base_lib/shared/utils/blx_images_svg_lib.dart';
import 'package:biologix_base_lib/shared/utils/blx_sizes.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_colors.dart';
import 'package:biologix_base_lib/shared/views/styles/blx_typography.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_alert.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_card.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_switch.dart';
import 'package:biologix_base_lib/shared/views/widgets/blx_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodystarCard extends StatefulWidget {
  const BodystarCard({
    required this.onDeviceActive,
    required this.bodyPosition,
    required this.iconPosition,
    this.scanDevice,
    this.bodystarPayloadState,
    this.isSelected,
    this.serialNumber,
    this.fwVersion,
    this.backgroundColor,
    this.onHasUpdate,
    this.isRecording = false,
    this.connectionStatus = DeviceConnectionStatus.notConnected,
    super.key,
  });

  final BodystarScanDevice? scanDevice;
  final BodystarPayloadState? bodystarPayloadState;
  final String bodyPosition;
  final String iconPosition;
  final bool? isSelected;
  final int? serialNumber;
  final String? fwVersion;
  final Function(bool active)? onDeviceActive;
  final VoidCallback? onHasUpdate;
  final Color? backgroundColor;
  final bool isRecording;
  final DeviceConnectionStatus connectionStatus;

  @override
  State<BodystarCard> createState() => _BodystarCardState();
}

class _BodystarCardState extends State<BodystarCard> {
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
  void didUpdateWidget(covariant BodystarCard oldWidget) {
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
    final battery = widget.bodystarPayloadState?.battPercentage ?? 0;
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
                        BLXImagesSVGLib.bodystar,
                        excludeFromSemantics: true,
                        width: 24,
                      ),
                      const SizedBox(width: BLXSpacing.s2),
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BLXText(
                              // ignore: avoid_hardcoded_strings_in_widgets
                              'Bodystar',
                              textAlign: TextAlign.start,
                              style: BLXTypography.heading.xs.copyWith(
                                color: BLXColors.of(context).content.hight,
                              ),
                            ),
                            if (widget.bodystarPayloadState?.battPercentage !=
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
                if (widget.bodystarPayloadState != null) ...[
                  const SizedBox(height: BLXSpacing.s2),
                  if (widget.onHasUpdate != null) ...[
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
                    const SizedBox(height: BLXSpacing.s2),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BLXText(
                            t.position.toUpperCase(),
                            style: BLXTypography.overline.copyWith(
                              color: BLXColors.of(context).content.medium,
                            ),
                          ),
                        ],
                      ),
                      BLXText(
                        widget.bodyPosition,
                        style: BLXTypography.label.l.copyWith(
                          color: BLXColors.of(context).content.highlight,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
