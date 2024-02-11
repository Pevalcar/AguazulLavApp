import 'dart:async';

import 'package:aguazullavapp/lib.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'shared/widgets/updater_aler.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future mainCommon(AppEnvironment env) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
      await initHivWeb();
    } else {
      await initHive();
    }
 await checUpdate();
    EnvInfo.initialize(env);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

Future initHive() async {
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(EntradaSalidaModelAdapter());
  await Hive.openBox<EntradaSalidaModel>(COLLECTION_ENTRADSALIDA_NAME);
}

Future initHivWeb() async {
  Hive.registerAdapter(EntradaSalidaModelAdapter());
  await Hive.openBox<EntradaSalidaModel>(COLLECTION_ENTRADSALIDA_NAME);
}
