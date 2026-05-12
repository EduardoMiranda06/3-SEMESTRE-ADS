import 'package:flutter/material.dart';

/// Design System Colors
/// Paleta inspirada no site oficial do Recanto dos Velhinhos
class AppColors {
  // Cores primárias - Verdes institucionais acolhedores
  static const Color primary = Color(0xFF2D5F4F); // Verde principal profundo
  static const Color primaryLight = Color(0xFF4A7F6A); // Verde médio
  static const Color primaryVeryLight = Color(0xFFF0F7F4); // Verde muito claro

  // Cores secundárias - Tons quentes humanizados
  static const Color secondary = Color(0xFFD4A574); // Ouro/bege quente
  static const Color secondaryLight = Color(0xFFE8D4C4); // Bege muito claro
  static const Color accent = Color(0xFFF0A957); // Laranja suave

  // Cores neutras
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFAFBF9); // Branco muito suave
  static const Color surface = Color(0xFFF5F6F4); // Cinza muito claro
  
  // Cores de texto
  static const Color textPrimary = Color(0xFF1A1A1A); // Preto/cinza escuro
  static const Color textSecondary = Color(0xFF666666); // Cinza médio
  static const Color textTertiary = Color(0xFF999999); // Cinza claro

  // Cores funcionais
  static const Color success = Color(0xFF27AE60); // Verde de sucesso
  static const Color warning = Color(0xFFF39C12); // Amarelo de alerta
  static const Color error = Color(0xFFE74C3C); // Vermelho de erro
  static const Color info = Color(0xFF3498DB); // Azul de informação

  // Cores de borda e divisão
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFF0F0F0);

  // Cores de sobreposição (overlay/backdrop)
  static const Color overlayLight = Color(0xFFF5F5F5);
  static const Color overlayDark = Color(0x80000000); // 50% transparência

  // Gradient colors
  static const List<Color> gradientPrimary = [
    Color(0xFF2D5F4F),
    Color(0xFF4A7F6A),
  ];

  static const List<Color> gradientWarm = [
    Color(0xFFF0A957),
    Color(0xFFD4A574),
  ];

  // Sombras
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> subtleShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];
}