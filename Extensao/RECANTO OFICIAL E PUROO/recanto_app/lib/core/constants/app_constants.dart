/// Constantes gerais da aplicação
class AppConstants {
  // Informações da Instituição
  static const String appName = 'Recanto dos Velhinhos';
  static const String appVersion = '1.0.0';
  static const String institutionName = 'Recanto dos Velhinhos de Valinhos';
  
  // Contato
  static const String phoneNumber = '(19) 3829-8180';
  static const String whatsappNumber = '551938298180';
  static const String email = 'contato@recantodosvelhinhos.com.br';
  static const String address = 'R. João Bissoto Filho, 2061 - Ortizes, Valinhos - SP';
  static const String cnpj = '44.637.601/0001-85';
  
  // URLs
  static const String website = 'https://recantodosvelhinhos.com.br';
  static const String instagramUrl = 'https://www.instagram.com/recantodosvelhinhos/';
  static const String mapUrl = 'https://maps.app.goo.gl/LCRgWUGWDYnpagaE7';
  static const String whatsappUrl = 'https://wa.me/$whatsappNumber';
  static const String emailUrl = 'mailto:$email';
  
  // Datas
  static const String foundationDate = '30 de outubro de 1973';
  static const String yearsActive = 'mais de 50 anos';
  static const String residentsCount = '50 idosos';
  static const String staffCount = '60+ profissionais';
  static const String areaSize = '32.185 m²';
  
  // Mensagens
  static const String welcomeMessage = 'Bem-vindo ao Recanto dos Velhinhos';
  static const String tagline = 'Seu encontro de paz e dignidade na melhor fase da vida';
  
  // Duração de animações
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 3);
}

/// Estados de conexão
enum ConnectionState {
  idle,
  loading,
  success,
  error,
}

/// Tipos de formulário
enum FormType {
  contact,
  donation,
  volunteer,
  feedback,
}

/// Status de evento
enum EventStatus {
  upcoming,
  ongoing,
  past,
}

/// Categorias de atividades
class ActivityCategories {
  static const String criatividade = 'Criatividade';
  static const String saude = 'Saúde';
  static const String diversao = 'Diversão';
  static const String espiritual = 'Espiritual';
  static const String lazer = 'Lazer';
  static const String social = 'Social';
  static const String terapia = 'Terapia';
  static const String solidariedade = 'Solidariedade';
  static const String cultura = 'Cultura';

  static const List<String> all = [
    criatividade,
    saude,
    diversao,
    espiritual,
    lazer,
    social,
    terapia,
    solidariedade,
    cultura,
  ];
}

/// Categorias de serviços
class ServiceCategories {
  static const String saude = 'Saúde';
  static const String seguranca = 'Segurança';
  static const String nutricao = 'Nutrição';
  static const String mental = 'Mental';
  static const String fitness = 'Fitness';
  static const String reabilitacao = 'Reabilitação';
  static const String social = 'Social';
  static const String arte = 'Arte';

  static const List<String> all = [
    saude,
    seguranca,
    nutricao,
    mental,
    fitness,
    reabilitacao,
    social,
    arte,
  ];
}

/// Validadores e helpers
class Validators {
  /// Valida email
  static bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  /// Valida telefone
  static bool isValidPhone(String phone) {
    return RegExp(r'^[\d\s\-\(\)]+$').hasMatch(phone) && phone.length >= 10;
  }

  /// Valida CNPJ
  static bool isValidCNPJ(String cnpj) {
    final cleanCNPJ = cnpj.replaceAll(RegExp(r'\D'), '');
    return cleanCNPJ.length == 14;
  }

  /// Remove caracteres especiais do CNPJ
  static String formatCNPJ(String cnpj) {
    final clean = cnpj.replaceAll(RegExp(r'\D'), '');
    if (clean.length != 14) return cnpj;
    return '${clean.substring(0, 2)}.${clean.substring(2, 5)}.${clean.substring(5, 8)}/${clean.substring(8, 12)}-${clean.substring(12)}';
  }

  /// Formata telefone
  static String formatPhone(String phone) {
    final clean = phone.replaceAll(RegExp(r'\D'), '');
    if (clean.isEmpty) return '';
    if (clean.length <= 2) return '(${clean}';
    if (clean.length <= 6) return '(${clean.substring(0, 2)}) ${clean.substring(2)}';
    if (clean.length <= 10) {
      return '(${clean.substring(0, 2)}) ${clean.substring(2, 6)}-${clean.substring(6)}';
    }
    return '(${clean.substring(0, 2)}) ${clean.substring(2, 7)}-${clean.substring(7, 11)}';
  }
}

/// Strings padrão
class AppStrings {
  // Erros
  static const String errorGeneral = 'Algo deu errado. Tente novamente.';
  static const String errorNetwork = 'Erro de conexão. Verifique sua internet.';
  static const String errorNotFound = 'Não encontrado.';
  static const String errorValidation = 'Preencha todos os campos corretamente.';
  
  // Sucesso
  static const String successGeneral = 'Operação realizada com sucesso!';
  static const String successForm = 'Formulário enviado com sucesso!';
  static const String successContact = 'Mensagem enviada com sucesso!';
  
  // Botões
  static const String btnSend = 'Enviar';
  static const String btnCancel = 'Cancelar';
  static const String btnSave = 'Salvar';
  static const String btnDelete = 'Deletar';
  static const String btnEdit = 'Editar';
  static const String btnViewMore = 'Ver Mais';
  static const String btnClose = 'Fechar';
  static const String btnTryAgain = 'Tentar Novamente';
  static const String btnGoHome = 'Ir para Home';
  
  // Validação
  static const String errorRequired = 'Este campo é obrigatório';
  static const String errorMinLength = 'Campo muito curto';
  static const String errorMaxLength = 'Campo muito longo';
  static const String errorInvalidEmail = 'E-mail inválido';
  static const String errorInvalidPhone = 'Telefone inválido';
}