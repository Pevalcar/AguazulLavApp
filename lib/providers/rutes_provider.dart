import 'package:aguazullavapp/providers/global/firebase_control.dart';
import 'package:aguazullavapp/ui/addService/add_service_screen.dart';
import 'package:aguazullavapp/ui/login/login.dart';
import 'package:aguazullavapp/ui/principal/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rutes_provider.g.dart';

@riverpod
GoRouter enrutador(EnrutadorRef ref) {
  final user = ref.watch(firebaseControlProvider);
  return GoRouter(
      initialLocation: user.asData?.value == null ? '/' : "/principal",
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: "/addService",
          builder: (context, state) => const AddServiceScreen(),
        ),
        GoRoute(
          path: "/principal",
          builder: (context, state) => const HomePage(),
        )
      ]);
}
