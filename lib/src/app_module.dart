import 'package:bxutility3/src/core_module.dart';
import 'package:bxutility3/src/exam/exam_module.dart';
import 'package:bxutility3/src/home/home_module.dart';
import 'package:bxutility3/src/sensors/sensors_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

// coverage:ignore-file
final appModule = createModule(
  register: (c) => c
    ..module(coreModule)
    ..module(homeModule)
    ..module(sensorsModule)
    ..module(examModule),
);
