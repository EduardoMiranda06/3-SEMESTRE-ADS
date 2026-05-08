import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design System Text Styles
/// Tipografia acessível e moderna
class AppTextStyles {
  // Fonte principal - usando Google Fonts para melhor renderização
  static TextStyle _baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = const Color(0xFF1A1A1A),
    double height = 1.5,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.openSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display styles - Para títulos principais e impactantes
  static TextStyle displayLarge({Color? color}) {
    return _baseStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.3,
      letterSpacing: -0.5,
    );
  }

  static TextStyle displayMedium({Color? color}) {
    return _baseStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.4,
      letterSpacing: -0.25,
    );
  }

  static TextStyle displaySmall({Color? color}) {
    return _baseStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.4,
    );
  }

  // Heading styles - Para títulos de seções
  static TextStyle headlineLarge({Color? color}) {
    return _baseStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.4,
    );
  }

  static TextStyle headlineMedium({Color? color}) {
    return _baseStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.4,
    );
  }

  static TextStyle headlineSmall({Color? color}) {
    return _baseStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.4,
    );
  }

  // Title styles - Para títulos de cards e subsecções
  static TextStyle titleLarge({Color? color}) {
    return _baseStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.5,
    );
  }

  static TextStyle titleMedium({Color? color}) {
    return _baseStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.5,
    );
  }

  static TextStyle titleSmall({Color? color}) {
    return _baseStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.5,
    );
  }

  // Body styles - Para conteúdo principal
  static TextStyle bodyLarge({Color? color}) {
    return _baseStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.6,
      letterSpacing: 0.15,
    );
  }

  static TextStyle bodyMedium({Color? color}) {
    return _baseStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? const Color(0xFF1A1A1A),
      height: 1.6,
      letterSpacing: 0.1,
    );
  }

  static TextStyle bodySmall({Color? color}) {
    return _baseStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? const Color(0xFF666666),
      height: 1.5,
      letterSpacing: 0.2,
    );
  }

  // Label styles - Para labels, badges, tags
  static TextStyle labelLarge({Color? color}) {
    return _baseStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF1A1A1A),
      letterSpacing: 0.5,
    );
  }

  static TextStyle labelMedium({Color? color}) {
    return _baseStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: color ?? const Color(0xFF1A1A1A),
      letterSpacing: 0.5,
    );
  }

  static TextStyle labelSmall({Color? color}) {
    return _baseStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: color ?? const Color(0xFF1A1A1A),
      letterSpacing: 0.4,
    );
  }

  // Button text style
  static TextStyle buttonText({Color? color}) {
    return _baseStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.white,
      letterSpacing: 0.5,
    );
  }

  // Caption style - Para textos muito pequenos, datas, etc
  static TextStyle caption({Color? color}) {
    return _baseStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? const Color(0xFF999999),
      height: 1.4,
      letterSpacing: 0.1,
    );
  }

  // Overline style - Para sobrelinhas, avisos
  static TextStyle overline({Color? color}) {
    return _baseStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: color ?? const Color(0xFF666666),
      letterSpacing: 1.5,
      height: 1.4,
    );
  }
}