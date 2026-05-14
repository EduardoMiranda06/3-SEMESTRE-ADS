/// Curves de animação padrão
import 'package:flutter/material.dart';
/// Constantes de espaçamento
/// Mantém consistência visual em todo o app
class AppSpacing {
  // Espaçamentos básicos
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  // Padding padrão para telas
  static const double screenPaddingHorizontal = 16;
  static const double screenPaddingVertical = 16;

  // Espaçamento entre cards
  static const double cardSpacing = 16;

  // Border radius padrão
  static const double radiusSmall = 8;
  static const double radiusMedium = 12;
  static const double radiusLarge = 16;
  static const double radiusXLarge = 24;
  static const double radiusRound = 50;

  // Altura de componentes
  static const double buttonHeight = 48;
  static const double buttonHeightSmall = 40;
  static const double inputHeight = 48;
  static const double appBarHeight = 56;

  // Largura máxima de conteúdo (para responsividade)
  static const double maxContentWidth = 600;
}

/// Constantes gerais da aplicação
class AppConstants {
  // Informações de contato
  static const String phoneNumber = '(19) 3829-8180';
  static const String email = 'contato@recantodosvelhinhos.com.br';
  static const String address = 'R. João Bissoto Filho, 2061 - Ortizes, Valinhos - SP';
  static const String whatsappNumber = '551938298180';
  static const String cnpj = '44.637.601/0001-85';
  
  // URLs
  static const String website = 'https://recantodosvelhinhos.com.br';
  static const String instagramUrl = 'https://www.instagram.com/recantodosvelhinhos/';
  static const String mapUrl = 'https://maps.app.goo.gl/LCRgWUGWDYnpagaE7';
  static const String whatsappUrl = 'http://wa.me/$whatsappNumber';

  // Datas
  static const String foundationDate = '30 de outubro de 1973';
  static const String yearsActive = 'mais de 50 anos';
  static const String residentsCount = '50 idosos';
  static const String staffCount = '60+ profissionais';
}

/// Durações de animação padrão
class AppDurations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
}



class AppCurves {
  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve deemphasized = Curves.easeInCubic;
  static const Curve sharp = Curves.easeInQuad;
}