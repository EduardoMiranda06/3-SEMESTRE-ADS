import '../models/news_model.dart';

/// Repositório de Notícias
/// Implementação local com dados mockados
/// Arquitetura preparada para futura integração com API
class NewsRepository {
  // Mock data
  static final List<NewsModel> _mockNews = [
    NewsModel(
      id: '1',
      title: 'Recanto celebra 50 anos de história e humanidade',
      description:
          'Instituição marca cinco décadas de acolhimento e cuidado com idosos.',
      content:
          'O Recanto dos Velhinhos de Valinhos celebrou seus 50 anos com emoção, reconhecendo cinco décadas de acolhimento e cuidado dedicado aos idosos. A celebração contou com a presença de residentes, colaboradores, voluntários e apoiadores que ao longo dos anos transformaram sonhos em realidade.',
      author: 'Equipe Recanto',
      publishedAt: DateTime.now().subtract(const Duration(days: 5)),
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-65-1.png',
      tags: ['Aniversário', 'Celebração', 'História'],
    ),
    NewsModel(
      id: '2',
      title: 'Novos voluntários eleitos para o projeto "Caminhada Assistida"',
      description:
          'Comunidade se mobiliza para apoiar atividade fundamental do Recanto.',
      content:
          'Com sucesso, foram eleitos 12 novos voluntários para integrar o projeto "Caminhada Assistida". A atividade estimula a autonomia dos idosos, proporcionando momentos de liberdade e confiança com apoio especializado.',
      author: 'Equipe Voluntários',
      publishedAt: DateTime.now().subtract(const Duration(days: 10)),
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-53-768x563.png',
      tags: ['Voluntários', 'Atividades', 'Comunidade'],
    ),
    NewsModel(
      id: '3',
      title: 'Musicoterapia traz alegria e memórias aos residentes',
      description: 'Sessões de música promovem bem-estar emocional e afetivo.',
      content:
          'As sessões de musicoterapia do Recanto continuam sendo momentos especiais onde a música funciona como ferramenta de expressão, resgatal memórias afetivas e promovendo equilíbrio emocional. Residentes relatam sentir-se mais alegres e conectados com suas histórias de vida.',
      author: 'Equipe Saúde',
      publishedAt: DateTime.now().subtract(const Duration(days: 15)),
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-77.png',
      tags: ['Saúde Mental', 'Terapia', 'Bem-estar'],
    ),
    NewsModel(
      id: '4',
      title: 'Bazar do Recanto amplia horários de funcionamento',
      description:
          'Mais oportunidades para a comunidade ajudar e adquirir produtos.',
      content:
          'O Bazar do Recanto, importante fonte de renda para a instituição, ampliou seus horários. Agora funciona não apenas às quartas-feiras, mas também em outros dias da semana, oferecendo mais oportunidades para que a comunidade possa contribuir e encontrar produtos especiais.',
      author: 'Administração',
      publishedAt: DateTime.now().subtract(const Duration(days: 20)),
      tags: ['Bazar', 'Comunidade', 'Solidariedade'],
    ),
  ];

  /// Busca todas as notícias
  Future<List<NewsModel>> getAllNews() async {
    // Simula delay de API
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockNews;
  }

  /// Busca notícia por ID
  Future<NewsModel?> getNewsById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockNews.firstWhere((news) => news.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Busca notícias recentes (últimos N dias)
  Future<List<NewsModel>> getRecentNews({int days = 30}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final cutoffDate = DateTime.now().subtract(Duration(days: days));
    return _mockNews
        .where((news) => news.publishedAt.isAfter(cutoffDate))
        .toList();
  }

  /// Busca notícias por tag
  Future<List<NewsModel>> getNewsByTag(String tag) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockNews.where((news) => news.tags.contains(tag)).toList();
  }

  /// Busca notícias com paginação
  Future<List<NewsModel>> getNewsPaginated(int page, int limit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    
    if (startIndex >= _mockNews.length) {
      return [];
    }
    
    return _mockNews.sublist(
      startIndex,
      endIndex > _mockNews.length ? _mockNews.length : endIndex,
    );
  }

  /// Adiciona notícia (para futura integração com API)
  Future<bool> addNews(NewsModel news) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockNews.add(news);
    return true;
  }

  /// Atualiza notícia
  Future<bool> updateNews(NewsModel news) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _mockNews.indexWhere((n) => n.id == news.id);
    if (index != -1) {
      _mockNews[index] = news;
      return true;
    }
    return false;
  }

  /// Deleta notícia
  Future<bool> deleteNews(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockNews.removeWhere((news) => news.id == id);
    return true;
  }
}