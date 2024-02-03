import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283914642),
      surfaceTint: Color(4283914642),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292993279),
      onPrimaryContainer: Color(4279374923),
      secondary: Color(4284243314),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293058809),
      onSecondaryContainer: Color(4279835180),
      tertiary: Color(4286141290),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957293),
      onTertiaryContainer: Color(4281209125),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      surfaceVariant: Color(4293190124),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4286019200),
      outlineVariant: Color(4291282384),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294176759),
      inversePrimary: Color(4290822655),
      primaryFixed: Color(4292993279),
      onPrimaryFixed: Color(4279374923),
      primaryFixedDim: Color(4290822655),
      onPrimaryFixedVariant: Color(4282335608),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279835180),
      secondaryFixedDim: Color(4291151069),
      onSecondaryFixedVariant: Color(4282729817),
      tertiaryFixed: Color(4294957293),
      onTertiaryFixed: Color(4281209125),
      tertiaryFixedDim: Color(4293442004),
      onTertiaryFixedVariant: Color(4284431442),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282072436),
      surfaceTint: Color(4283914642),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285362090),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282466645),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285756296),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284102734),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287719809),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      surfaceVariant: Color(4293190124),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284440167),
      outlineVariant: Color(4286282371),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294176759),
      inversePrimary: Color(4290822655),
      primaryFixed: Color(4285362090),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283717519),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285756296),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284111471),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287719809),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285944167),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279835473),
      surfaceTint: Color(4283914642),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282072436),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280295731),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282466645),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281735212),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284102734),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293190124),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293716735),
      primaryFixed: Color(4282072436),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280559452),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282466645),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280953662),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284102734),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282524215),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663776),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374138),
      surfaceContainer: Color(4293979380),
      surfaceContainerHigh: Color(4293584879),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290822655),
      surfaceTint: Color(4290822655),
      onPrimary: Color(4280822368),
      primaryContainer: Color(4282335608),
      onPrimaryContainer: Color(4292993279),
      secondary: Color(4291151069),
      onSecondary: Color(4281216834),
      secondaryContainer: Color(4282729817),
      onSecondaryContainer: Color(4293058809),
      tertiary: Color(4293442004),
      onTertiary: Color(4282787387),
      tertiaryContainer: Color(4284431442),
      onTertiaryContainer: Color(4294957293),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279440152),
      onBackground: Color(4293190121),
      surface: Color(4279440152),
      onSurface: Color(4293190121),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4291282384),
      outline: Color(4287729562),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inverseOnSurface: Color(4281348150),
      inversePrimary: Color(4283914642),
      primaryFixed: Color(4292993279),
      onPrimaryFixed: Color(4279374923),
      primaryFixedDim: Color(4290822655),
      onPrimaryFixedVariant: Color(4282335608),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279835180),
      secondaryFixedDim: Color(4291151069),
      onSecondaryFixedVariant: Color(4282729817),
      tertiaryFixed: Color(4294957293),
      onTertiaryFixed: Color(4281209125),
      tertiaryFixedDim: Color(4293442004),
      onTertiaryFixedVariant: Color(4284431442),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291151615),
      surfaceTint: Color(4290822655),
      onPrimary: Color(4278979909),
      primaryContainer: Color(4287204552),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291479777),
      onSecondary: Color(4279506214),
      secondaryContainer: Color(4287598501),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293770712),
      onTertiary: Color(4280814624),
      tertiaryContainer: Color(4289692829),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279440152),
      onBackground: Color(4293190121),
      surface: Color(4279440152),
      onSurface: Color(4294834687),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4291611092),
      outline: Color(4288914092),
      outlineVariant: Color(4286808716),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inverseOnSurface: Color(4280953135),
      inversePrimary: Color(4282401658),
      primaryFixed: Color(4292993279),
      onPrimaryFixed: Color(4278585153),
      primaryFixedDim: Color(4290822655),
      onPrimaryFixedVariant: Color(4281217127),
      secondaryFixed: Color(4293058809),
      onSecondaryFixed: Color(4279176993),
      secondaryFixedDim: Color(4291151069),
      onSecondaryFixedVariant: Color(4281611592),
      tertiaryFixed: Color(4294957293),
      onTertiaryFixed: Color(4280420122),
      tertiaryFixedDim: Color(4293442004),
      onTertiaryFixedVariant: Color(4283182145),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294834687),
      surfaceTint: Color(4290822655),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291151615),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834687),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291479777),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293770712),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279440152),
      onBackground: Color(4293190121),
      surface: Color(4279440152),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4294834687),
      outline: Color(4291611092),
      outlineVariant: Color(4291611092),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280362074),
      primaryFixed: Color(4293321983),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291151615),
      onPrimaryFixedVariant: Color(4278979909),
      secondaryFixed: Color(4293321982),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291479777),
      onSecondaryFixedVariant: Color(4279506214),
      tertiaryFixed: Color(4294958831),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293770712),
      onTertiaryFixedVariant: Color(4280814624),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940031),
      surfaceContainerLowest: Color(4279111187),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280953135),
      surfaceContainerHighest: Color(4281676858),
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
