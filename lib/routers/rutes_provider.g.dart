// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rutes_provider.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeMenuRoute,
      $loginRoute,
      $addServiceRoute,
      $listVehiculosRoute,
      $addServiceTypeRoute,
      $historyScreenRoute,
      $adminClientScreen,
      $upgraderRoute,
    ];

RouteBase get $homeMenuRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeMenuRouteExtension._fromState,
    );

extension $HomeMenuRouteExtension on HomeMenuRoute {
  static HomeMenuRoute _fromState(GoRouterState state) => const HomeMenuRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addServiceRoute => GoRouteData.$route(
      path: '/addService',
      factory: $AddServiceRouteExtension._fromState,
    );

extension $AddServiceRouteExtension on AddServiceRoute {
  static AddServiceRoute _fromState(GoRouterState state) =>
      const AddServiceRoute();

  String get location => GoRouteData.$location(
        '/addService',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $listVehiculosRoute => GoRouteData.$route(
      path: '/listvehiculos',
      factory: $ListVehiculosRouteExtension._fromState,
    );

extension $ListVehiculosRouteExtension on ListVehiculosRoute {
  static ListVehiculosRoute _fromState(GoRouterState state) =>
      const ListVehiculosRoute();

  String get location => GoRouteData.$location(
        '/listvehiculos',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addServiceTypeRoute => GoRouteData.$route(
      path: '/addServiceType',
      factory: $AddServiceTypeRouteExtension._fromState,
    );

extension $AddServiceTypeRouteExtension on AddServiceTypeRoute {
  static AddServiceTypeRoute _fromState(GoRouterState state) =>
      const AddServiceTypeRoute();

  String get location => GoRouteData.$location(
        '/addServiceType',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $historyScreenRoute => GoRouteData.$route(
      path: '/history',
      factory: $HistoryScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'listJornadas',
          factory: $ListJornadasRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'jornada',
              factory: $JornadaInfoRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HistoryScreenRouteExtension on HistoryScreenRoute {
  static HistoryScreenRoute _fromState(GoRouterState state) =>
      const HistoryScreenRoute();

  String get location => GoRouteData.$location(
        '/history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListJornadasRouteExtension on ListJornadasRoute {
  static ListJornadasRoute _fromState(GoRouterState state) =>
      const ListJornadasRoute();

  String get location => GoRouteData.$location(
        '/history/listJornadas',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JornadaInfoRouteExtension on JornadaInfoRoute {
  static JornadaInfoRoute _fromState(GoRouterState state) => JornadaInfoRoute(
        $extra: state.extra as Jornada?,
      );

  String get location => GoRouteData.$location(
        '/history/listJornadas/jornada',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $adminClientScreen => GoRouteData.$route(
      path: '/adminClient',
      factory: $AdminClientScreenExtension._fromState,
    );

extension $AdminClientScreenExtension on AdminClientScreen {
  static AdminClientScreen _fromState(GoRouterState state) =>
      const AdminClientScreen();

  String get location => GoRouteData.$location(
        '/adminClient',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $upgraderRoute => GoRouteData.$route(
      path: '/upgrader',
      factory: $UpgraderRouteExtension._fromState,
    );

extension $UpgraderRouteExtension on UpgraderRoute {
  static UpgraderRoute _fromState(GoRouterState state) => const UpgraderRoute();

  String get location => GoRouteData.$location(
        '/upgrader',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$enrutadorHash() => r'c9f255072970817e259c111410b3067b8400d889';

/// See also [enrutador].
@ProviderFor(enrutador)
final enrutadorProvider = AutoDisposeProvider<GoRouter>.internal(
  enrutador,
  name: r'enrutadorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$enrutadorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnrutadorRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
