import 'package:aguazullavapp/lib.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rutes_provider.g.dart';

@riverpod
GoRouter enrutador(EnrutadorRef ref) {
  final user = ref.watch(firebaseControlProvider);
  return GoRouter(
      initialLocation: user.asData?.value == null ? '/' : "/menu",
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
        ),
        GoRoute(
          path: "/menu",
          builder: (context, state) => const MainMenuScreen(),
        )
      ]);
}
