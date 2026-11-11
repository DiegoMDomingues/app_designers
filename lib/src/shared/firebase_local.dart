import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// Firebase "de mentira" para o projeto dos designers.
///
/// A biologix_base_lib usa o Crashlytics dentro do logger (blxLogger) e quebra
/// se o Firebase não estiver iniciado. Aqui ele é iniciado com valores falsos:
/// não há chave real nem conexão com nenhum projeto Firebase da Biologix, e o
/// envio de relatórios fica sempre desligado.
Future<void> initFirebaseLocal() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'designers-local-sem-chave',
      appId: '1:000000000000:android:0000000000000000',
      messagingSenderId: '000000000000',
      projectId: 'app-designers-local',
    ),
  );
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
}
