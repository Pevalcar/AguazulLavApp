import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff575992),
      surfaceTint: Color(0xff575992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe1e0ff),
      onPrimaryContainer: Color(0xff12144b),
      secondary: Color(0xff5c5d72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe2e0f9),
      onSecondaryContainer: Color(0xff191a2c),
      tertiary: Color(0xff79536a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8ed),
      onTertiaryContainer: Color(0xff2e1125),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffbf8ff),
      onBackground: Color(0xff1b1b21),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff46464f),
      outline: Color(0xff777680),
      outlineVariant: Color(0xffc7c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inverseOnSurface: Color(0xfff3eff7),
      inversePrimary: Color(0xffc0c1ff),
      primaryFixed: Color(0xffe1e0ff),
      onPrimaryFixed: Color(0xff12144b),
      primaryFixedDim: Color(0xffc0c1ff),
      onPrimaryFixedVariant: Color(0xff3f4178),
      secondaryFixed: Color(0xffe2e0f9),
      onSecondaryFixed: Color(0xff191a2c),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff454559),
      tertiaryFixed: Color(0xffffd8ed),
      onTertiaryFixed: Color(0xff2e1125),
      tertiaryFixedDim: Color(0xffe8b9d4),
      onTertiaryFixedVariant: Color(0xff5f3c52),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b3d74),
      surfaceTint: Color(0xff575992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6d6faa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff414155),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff737388),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5a384e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff916981),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffbf8ff),
      onBackground: Color(0xff1b1b21),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff42424b),
      outline: Color(0xff5f5e67),
      outlineVariant: Color(0xff7b7a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inverseOnSurface: Color(0xfff3eff7),
      inversePrimary: Color(0xffc0c1ff),
      primaryFixed: Color(0xff6d6faa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff54578f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff737388),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5a5a6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff916981),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff765167),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff191b51),
      surfaceTint: Color(0xff575992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3b3d74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff202133),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff414155),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff36182c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a384e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffbf8ff),
      onBackground: Color(0xff1b1b21),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff23232b),
      outline: Color(0xff42424b),
      outlineVariant: Color(0xff42424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffeceaff),
      primaryFixed: Color(0xff3b3d74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff24275c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff414155),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2a2b3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a384e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff422237),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc0c1ff),
      surfaceTint: Color(0xffc0c1ff),
      onPrimary: Color(0xff282a60),
      primaryContainer: Color(0xff3f4178),
      onPrimaryContainer: Color(0xffe1e0ff),
      secondary: Color(0xffc5c4dd),
      onSecondary: Color(0xff2e2f42),
      secondaryContainer: Color(0xff454559),
      onSecondaryContainer: Color(0xffe2e0f9),
      tertiary: Color(0xffe8b9d4),
      onTertiary: Color(0xff46263b),
      tertiaryContainer: Color(0xff5f3c52),
      onTertiaryContainer: Color(0xffffd8ed),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff131318),
      onBackground: Color(0xffe4e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xffe4e1e9),
      surfaceVariant: Color(0xff46464f),
      onSurfaceVariant: Color(0xffc7c5d0),
      outline: Color(0xff918f9a),
      outlineVariant: Color(0xff46464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inverseOnSurface: Color(0xff303036),
      inversePrimary: Color(0xff575992),
      primaryFixed: Color(0xffe1e0ff),
      onPrimaryFixed: Color(0xff12144b),
      primaryFixedDim: Color(0xffc0c1ff),
      onPrimaryFixedVariant: Color(0xff3f4178),
      secondaryFixed: Color(0xffe2e0f9),
      onSecondaryFixed: Color(0xff191a2c),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff454559),
      tertiaryFixed: Color(0xffffd8ed),
      onTertiaryFixed: Color(0xff2e1125),
      tertiaryFixedDim: Color(0xffe8b9d4),
      onTertiaryFixedVariant: Color(0xff5f3c52),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc5c6ff),
      surfaceTint: Color(0xffc0c1ff),
      onPrimary: Color(0xff0c0d45),
      primaryContainer: Color(0xff898cc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcac8e1),
      onSecondary: Color(0xff141526),
      secondaryContainer: Color(0xff8f8fa5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffedbdd8),
      onTertiary: Color(0xff280c20),
      tertiaryContainer: Color(0xffaf849d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131318),
      onBackground: Color(0xffe4e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xfffdf9ff),
      surfaceVariant: Color(0xff46464f),
      onSurfaceVariant: Color(0xffccc9d4),
      outline: Color(0xffa3a2ac),
      outlineVariant: Color(0xff83828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inverseOnSurface: Color(0xff2a292f),
      inversePrimary: Color(0xff40437a),
      primaryFixed: Color(0xffe1e0ff),
      onPrimaryFixed: Color(0xff060741),
      primaryFixedDim: Color(0xffc0c1ff),
      onPrimaryFixedVariant: Color(0xff2e3067),
      secondaryFixed: Color(0xffe2e0f9),
      onSecondaryFixed: Color(0xff0f0f21),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff343548),
      tertiaryFixed: Color(0xffffd8ed),
      onTertiaryFixed: Color(0xff22071a),
      tertiaryFixedDim: Color(0xffe8b9d4),
      onTertiaryFixedVariant: Color(0xff4c2c41),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffc0c1ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc5c6ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdf9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcac8e1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffedbdd8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131318),
      onBackground: Color(0xffe4e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff46464f),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffccc9d4),
      outlineVariant: Color(0xffccc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff21245a),
      primaryFixed: Color(0xffe6e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc5c6ff),
      onPrimaryFixedVariant: Color(0xff0c0d45),
      secondaryFixed: Color(0xffe6e4fe),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac8e1),
      onSecondaryFixedVariant: Color(0xff141526),
      tertiaryFixed: Color(0xffffdeef),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffedbdd8),
      onTertiaryFixedVariant: Color(0xff280c20),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
