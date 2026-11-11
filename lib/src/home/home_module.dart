import 'package:bxutility3/src/home/view/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

// coverage:ignore-file
final homeModule = createModule(
  path: '/',
  register: (i) => i.route('/', child: (context, state) => const HomePage()),
);
