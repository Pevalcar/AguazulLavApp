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
            path: "/menu",
            builder: (context, state) => const MainMenuScreen(),
            routes: []),
        GoRoute(
          path: "/addService",
          builder: (context, state) => const AddServiceScreen(),
        ),
        GoRoute(
          path: "/listvehiculos",
          builder: (context, state) => const ListVehiculos(),
        ),
        GoRoute(
          path: "/addServiceType",
          builder: (context, state) => const AddServiceTypeScreen(),
        )
      ]);
}
