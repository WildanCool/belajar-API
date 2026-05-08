import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // BASE TYPOGRAPHY
  static final TextTheme baseText = GoogleFonts.poppinsTextTheme();

  // LIGHT THEME
  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    // Pengaturan warna global
    colorScheme: ColorScheme.light(
      primary: Color(0xff1565c0),
      secondary: Color(0xff42a5f5),
      surface: Colors.white,
    ),

    // Warna Scaffold mode terang
    scaffoldBackgroundColor: const Color(0xfff5f5f5),

    // Pengaturan warna AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1565c0),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    // Pengaturan warna Card
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Pengaturan warna Dialog (Konfirmasi Hapus?)
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      titleTextStyle: AppTheme.baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black,
      ),
    ),

    // Pengaturan font tulisan aplikasi
    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black,
      ),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),
    ),
  );

  // DARK THEME
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    // Pengaturan warna global
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Color(0xff42a5f5),
      surface: Color(0xff1565c0),
    ),

    // Warna Scaffold mode terang
    scaffoldBackgroundColor: Colors.black,

    // Pengaturan warna AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    // Pengaturan warna Card
    cardTheme: CardThemeData(
      color: Colors.black,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Pengaturan warna Dialog (Konfirmasi Hapus?)
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      titleTextStyle: AppTheme.baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      contentTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
    ),

    // Pengaturan font tulisan aplikasi
    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),
    ),
  );
}
