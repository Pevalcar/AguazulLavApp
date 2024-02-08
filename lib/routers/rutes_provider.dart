import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rutes_provider.g.dart';

@riverpod
GoRouter enrutador(EnrutadorRef ref) {
  final user = ref.watch(userStateCurrentProvider);
  return GoRouter(
    initialLocation: user.asData?.value == null ? '/login' : "/",
    routes: $appRoutes,
    errorBuilder: (c, s) => ErrorRoute(error: s.error!).build(c, s),
  );
}

@TypedGoRoute<HomeMenuRoute>(path: "/")
class HomeMenuRoute extends GoRouteData {
  const HomeMenuRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MainMenuScreen();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const Login();
}

@TypedGoRoute<AddServiceRoute>(path: '/addService')
class AddServiceRoute extends GoRouteData {
  const AddServiceRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddServiceScreen();
}

@TypedGoRoute<ListVehiculosRoute>(path: '/listvehiculos')
class ListVehiculosRoute extends GoRouteData {
  const ListVehiculosRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListVehicles();
}

@TypedGoRoute<AddServiceTypeRoute>(path: '/addServiceType')
class AddServiceTypeRoute extends GoRouteData {
  const AddServiceTypeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddServiceTypeScreen();
}

@TypedGoRoute<HistoryScreenRoute>(path: '/history', routes: [
  TypedGoRoute<ListJornadasRoute>(path: "listJornadas", routes: [
    TypedGoRoute<JornadaInfoRoute>(
      path: "jornada",
    ),
  ]),
])
@immutable
class HistoryScreenRoute extends GoRouteData {
  const HistoryScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HistoryScreen();
  }
}

@immutable
class ListJornadasRoute extends GoRouteData {
  const ListJornadasRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListJornadas();
}

@immutable
class JornadaInfoRoute extends GoRouteData {
  final Jornada? $extra;

  const JornadaInfoRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      JornadaInfoScreen(jornada: $extra);
}

@TypedGoRoute<AdminClientScreen>(path: '/adminClient', routes: [])
@immutable
class AdminClientScreen extends GoRouteData {
  const AdminClientScreen();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AdminClientScreenPage();
  
}

@TypedGoRoute<UpgraderRoute>(path: "/upgrader")
class UpgraderRoute extends GoRouteData {
  const UpgraderRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const UpdaterScreenPage();
}

//TODO Mejorar la pantalla de errores
@immutable
class ErrorRoute extends GoRouteData {
  const ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) => Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Text(error.toString()),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/menu");
            },
            child: const Text("Volver"),
          )
        ],
      )));
}
