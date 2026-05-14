import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Importações necessárias
import 'dart:math' show pow;
// Necessário para clipboard
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

/// Utilitários gerais
class AppUtils {
  /// Formata data para formato brasileiro
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'pt_BR').format(date);
  }

  /// Formata data com hora
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(dateTime);
  }

  /// Formata hora
  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm', 'pt_BR').format(dateTime);
  }

  /// Calcula diferença de dias
  static int daysDifference(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }

  /// Retorna distância de tempo legível
  static String timeAgoFromNow(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} ano(s) atrás';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} mês(es) atrás';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} dia(s) atrás';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hora(s) atrás';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minuto(s) atrás';
    } else {
      return 'agora mesmo';
    }
  }

  /// Formata valor monetário
  static String formatCurrency(double value) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
  }

  /// Formata número com separador de milhar
  static String formatNumber(num number) {
    return NumberFormat('#,##0.00', 'pt_BR').format(number);
  }

  /// Trunca texto
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Valida CPF (básico)
  static bool isValidCPF(String cpf) {
    final clean = cpf.replaceAll(RegExp(r'\D'), '');
    return clean.length == 11;
  }

  /// Valida CNPJ (básico)
  static bool isValidCNPJ(String cnpj) {
    final clean = cnpj.replaceAll(RegExp(r'\D'), '');
    return clean.length == 14;
  }

  /// Remove caracteres especiais
  static String removeSpecialCharacters(String text) {
    return text.replaceAll(RegExp(r'[^\w\s]'), '');
  }

  /// Capitaliza primeira letra
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }

  /// Capitaliza cada palavra
  static String capitalizeWords(String text) {
    return text
        .split(' ')
        .map((word) => capitalize(word))
        .join(' ');
  }

  /// Verifica se URL é válida
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Cria uma cor a partir de string HEX
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Converte cor para HEX
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  /// Gera ID aleatório
  static String generateRandomId({int length = 16}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = List<int>.generate(length, (_) => chars.codeUnitAt(0));
    return String.fromCharCodes(random);
  }

  /// Copia texto para clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Valida força de senha
  static double validatePasswordStrength(String password) {
    if (password.isEmpty) return 0;

    double strength = 0;

    // Comprimento
    if (password.length >= 8) strength += 0.25;
    if (password.length >= 12) strength += 0.1;

    // Letras maiúsculas
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.15;

    // Letras minúsculas
    if (password.contains(RegExp(r'[a-z]'))) strength += 0.15;

    // Números
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.15;

    // Caracteres especiais
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.2;

    return strength.clamp(0, 1);
  }
}

/// Logger customizado
class AppLogger {
  static void log(String message, {String tag = 'Log'}) {
    print('[$tag] $message');
  }

  static void info(String message) {
    log(message, tag: 'INFO');
  }

  static void warning(String message) {
    log(message, tag: 'WARNING');
  }

  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    log(message, tag: 'ERROR');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('StackTrace: $stackTrace');
    }
  }

  static void success(String message) {
    log(message, tag: 'SUCCESS');
  }

  static void debug(String message) {
    log(message, tag: 'DEBUG');
  }
}

/// Extensões úteis
extension StringExtension on String {
  /// Capitaliza a primeira letra
  String get capitalize => this.isEmpty ? this : '${this[0].toUpperCase()}${this.substring(1)}';

  /// Verifica se é email válido
  bool get isValidEmail => RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(this);

  /// Verifica se é URL válida
  bool get isValidUrl {
    try {
      Uri.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Remove espaços em branco
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Remove caracteres especiais
  String get removeSpecialCharacters => replaceAll(RegExp(r'[^\w\s]'), '');
}

extension IntExtension on int {
  /// Formata número como moeda
  String get asCurrency => NumberFormat.simpleCurrency(locale: 'pt_BR').format(this);

  /// Converte em string com sufixo
  String get asSuffix {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }
    return toString();
  }
}

extension DoubleExtension on double {
  /// Formata número como moeda
  String get asCurrency => NumberFormat.simpleCurrency(locale: 'pt_BR').format(this);

  /// Arredonda para N casas decimais
  double roundTo(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}

extension DateTimeExtension on DateTime {
  /// Formata data em formato brasileiro
  String get asBrazilianDate => AppUtils.formatDate(this);

  /// Formata data e hora em formato brasileiro
  String get asBrazilianDateTime => AppUtils.formatDateTime(this);

  /// Formata hora
  String get asFormattedTime => AppUtils.formatTime(this);

  /// Retorna distância de tempo legível
  String get timeAgo => AppUtils.timeAgoFromNow(this);

  /// Verifica se é hoje
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Verifica se é ontem
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Retorna início do dia
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Retorna fim do dia
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }
}

