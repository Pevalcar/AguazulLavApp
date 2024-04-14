enum AppEnvironment { dev, staging, prod }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'AguazullavApp Dev',
    AppEnvironment.staging: 'AguazullavApp Staging',
    AppEnvironment.prod: 'AguazullavApp',
  };

  static const _connectionStrings = {
    AppEnvironment.dev: 'https://api.spoonacular.com',
    AppEnvironment.staging: 'https://api.spoonacular.com',
    AppEnvironment.prod: 'https://api.spoonacular.com',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.staging: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
