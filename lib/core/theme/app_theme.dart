import 'package:flutter/material.dart';

class AppTheme {
  static const String _fontFamily = 'Inter';

  // Material Design 3 Typography Scale with Inter font
  static TextTheme get textTheme => const TextTheme(
    // Display styles - largest text, short and important text like page headers
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 57.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 45.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 36.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.22,
    ),

    // Headline styles - high-emphasis, shorter text like article headlines
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.0,
      height: 1.33,
    ),

    // Title styles - medium emphasis text like section titles
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.15,
      height: 1.50,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.1,
      height: 1.43,
    ),

    // Body styles - regular text content
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.15,
      height: 1.50,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400, // Regular
      letterSpacing: 0.4,
      height: 1.33,
    ),

    // Label styles - buttons, tabs, and other UI elements
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11.0,
      fontWeight: FontWeight.w700, // Bold
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );

  // Custom color scheme for book app
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2563EB), // Blue 600
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDBEAFE), // Blue 100
    onPrimaryContainer: Color(0xFF1E3A8A), // Blue 800
    secondary: Color(0xFF059669), // Emerald 600
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD1FAE5), // Emerald 100
    onSecondaryContainer: Color(0xFF064E3B), // Emerald 800
    tertiary: Color(0xFFDC2626), // Red 600
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFEE2E2), // Red 100
    onTertiaryContainer: Color(0xFF991B1B), // Red 800
    error: Color(0xFFDC2626), // Red 600
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2), // Red 100
    onErrorContainer: Color(0xFF991B1B), // Red 800
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF111827), // Gray 900
    surfaceContainerHighest: Color(0xFFF9FAFB), // Gray 50
    onSurfaceVariant: Color(0xFF6B7280), // Gray 500
    outline: Color(0xFFD1D5DB), // Gray 300
    outlineVariant: Color(0xFFF3F4F6), // Gray 100
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF111827), // Gray 900
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF93C5FD), // Blue 300
    surfaceTint: Color(0xFF2563EB), // Blue 600
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF60A5FA), // Blue 400
    onPrimary: Color(0xFF1E3A8A), // Blue 800
    primaryContainer: Color(0xFF1D4ED8), // Blue 700
    onPrimaryContainer: Color(0xFFDBEAFE), // Blue 100
    secondary: Color(0xFF34D399), // Emerald 400
    onSecondary: Color(0xFF064E3B), // Emerald 800
    secondaryContainer: Color(0xFF047857), // Emerald 700
    onSecondaryContainer: Color(0xFFD1FAE5), // Emerald 100
    tertiary: Color(0xFFF87171), // Red 400
    onTertiary: Color(0xFF991B1B), // Red 800
    tertiaryContainer: Color(0xFFDC2626), // Red 600
    onTertiaryContainer: Color(0xFFFEE2E2), // Red 100
    error: Color(0xFFF87171), // Red 400
    onError: Color(0xFF991B1B), // Red 800
    errorContainer: Color(0xFFDC2626), // Red 600
    onErrorContainer: Color(0xFFFEE2E2), // Red 100
    surface: Color(0xFF111827), // Gray 900
    onSurface: Color(0xFFF9FAFB), // Gray 50
    surfaceContainerHighest: Color(0xFF1F2937), // Gray 800
    onSurfaceVariant: Color(0xFF9CA3AF), // Gray 400
    outline: Color(0xFF4B5563), // Gray 600
    outlineVariant: Color(0xFF374151), // Gray 700
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF9FAFB), // Gray 50
    onInverseSurface: Color(0xFF111827), // Gray 900
    inversePrimary: Color(0xFF2563EB), // Blue 600
    surfaceTint: Color(0xFF60A5FA), // Blue 400
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: textTheme,
    colorScheme: _lightColorScheme,
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    textTheme: textTheme,
    colorScheme: _darkColorScheme,
  );
}