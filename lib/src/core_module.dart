import 'dart:io';

import 'package:biologix_base_lib/device.dart';
import 'package:flutter_modular/flutter_modular.dart';

// coverage:ignore-file
final coreModule = createModule(
  register: (c) {
    c.add(
      () => Platform.localeName.split('_').first,
    ); //Get System locale language

    // Bluetooth: procura e conversa com Oxistar e Bodystar.
    c.addInstance<DeviceManager>(deviceManagerUniversalBle);
  },
);
