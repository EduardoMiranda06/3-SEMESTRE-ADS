import '../models/event_model.dart';

/// Repositório de Eventos
/// Implementação local com dados mockados
class EventRepository {
  // Mock data
  static final List<EventModel> _mockEvents = [
    EventModel(
      id: '1',
      title: 'Atividade de Culinária Quinzenal',
      description: 'Momentos de interação e prazer em que os residentes colocam a mão na massa.',
      content:
          'Atividade quinzenal que promove interação, resgate de memórias afetivas e receitas de família. Mais do que cozinhar, essa atividade promove vínculos e estimula os sentidos dos residentes.',
      location: 'Cozinha do Recanto',
      organizer: 'Equipe de Atividades',
      startDate: DateTime.now().add(const Duration(days: 3)),
      endDate: DateTime.now().add(const Duration(days: 3, hours: 2)),
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-65-1.png',
      isFeatured: true,
      tags: ['Culinária', 'Atividade', 'Semanal'],
    ),
    EventModel(
      id: '2',
      title: 'Caminhada Assistida',
      description: 'Voluntários auxiliam idosos com dificuldades de locomoção.',
      content:
          'Voluntários especialmente treinados auxiliam os idosos que possuem dificuldades em caminhar sozinhos. A atividade estimula autonomia, promove sensação de liberdade e melhora a autoestima.',
      location: 'Áreas verdes do Recanto',
      organizer: 'Equipe de Voluntários',
      startDate: DateTime.now().add(const Duration(days: 5)),
      endDate: DateTime.now().add(const Duration(days: 5, hours: 1)),
      isFeatured: true,
      tags: ['Caminhada', 'Voluntários', 'Saúde'],
    ),
    EventModel(
      id: '3',
      title: 'Bingo Social',
      description: 'Momento divertido de interação e socialização.',
      content:
          'Um dos momentos mais esperados pelos residentes! Bingo com prêmios, risos, socialização e muita diversão. Atividade que estimula o convívio social e traz alegria aos participantes.',
      location: 'Sala de Atividades',
      organizer: 'Equipe Social',
      startDate: DateTime.now().add(const Duration(days: 7)),
      endDate: DateTime.now().add(const Duration(days: 7, hours: 2)),
      maxParticipants: 50,
      isFeatured: true,
      tags: ['Bingo', 'Diversão', 'Socialização'],
    ),
    EventModel(
      id: '4',
      title: 'Celebração Religiosa Semanal',
      description: 'Espaço de espiritualidade respeitando diferentes crenças.',
      content:
          'Celebração que respeita crenças e fortalece vínculos emocionais e espirituais. Um espaço seguro e acolhedor para que residentes possam expressar sua fé e encontrar paz.',
      location: 'Salão de Eventos',
      organizer: 'Equipe Pastoral',
      startDate: DateTime.now().add(const Duration(days: 2)),
      endDate: DateTime.now().add(const Duration(days: 2, hours: 1)),
      tags: ['Religião', 'Espiritualidade', 'Semanal'],
    ),
    EventModel(
      id: '5',
      title: 'Passeio pela Região',
      description: 'Explorando diferentes locais da cidade e região.',
      content:
          'Passeios semanais organizados a diferentes locais como parques, escolas, restaurantes e pontos turísticos. Proporcionam novas experiências, alegria e conexão com a comunidade.',
      location: 'Diversos locais em Valinhos',
      organizer: 'Equipe de Atividades',
      startDate: DateTime.now().add(const Duration(days: 10)),
      endDate: DateTime.now().add(const Duration(days: 10, hours: 3)),
      tags: ['Passeio', 'Comunidade', 'Experiência'],
    ),
    EventModel(
      id: '6',
      title: 'Roda de Conversa Mensal',
      description: 'Encontros que promovem diálogo e troca de experiências.',
      content:
          'Encontros mensais que promovem a escuta ativa, diálogo genuíno e troca de experiências de vida. Um espaço onde histórias são compartilhadas e vínculos são fortalecidos.',
      location: 'Sala de Convivência',
      organizer: 'Equipe Psicossocial',
      startDate: DateTime.now().add(const Duration(days: 8)),
      endDate: DateTime.now().add(const Duration(days: 8, hours: 2)),
      tags: ['Conversa', 'Socialização', 'Mensual'],
    ),
  ];

  /// Busca todos os eventos
  Future<List<EventModel>> getAllEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockEvents;
  }

  /// Busca evento por ID
  Future<EventModel?> getEventById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockEvents.firstWhere((event) => event.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Busca eventos destacados
  Future<List<EventModel>> getFeaturedEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockEvents.where((event) => event.isFeatured).toList();
  }

  /// Busca eventos futuros
  Future<List<EventModel>> getUpcomingEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockEvents.where((event) => event.isUpcoming).toList();
  }

  /// Busca eventos em andamento
  Future<List<EventModel>> getOngoingEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockEvents.where((event) => event.isOngoing).toList();
  }

  /// Busca eventos passados
  Future<List<EventModel>> getPastEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockEvents.where((event) => event.isPast).toList();
  }

  /// Busca eventos por tag
  Future<List<EventModel>> getEventsByTag(String tag) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockEvents.where((event) => event.tags.contains(tag)).toList();
  }

  /// Busca eventos próximos (próximos N dias)
  Future<List<EventModel>> getUpcomingEventsInDays(int days) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final cutoffDate = DateTime.now().add(Duration(days: days));
    return _mockEvents
        .where((event) =>
            event.startDate.isAfter(DateTime.now()) &&
            event.startDate.isBefore(cutoffDate))
        .toList();
  }

  /// Busca eventos com paginação
  Future<List<EventModel>> getEventsPaginated(int page, int limit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;

    if (startIndex >= _mockEvents.length) {
      return [];
    }

    return _mockEvents.sublist(
      startIndex,
      endIndex > _mockEvents.length ? _mockEvents.length : endIndex,
    );
  }

  /// Adiciona evento
  Future<bool> addEvent(EventModel event) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockEvents.add(event);
    return true;
  }

  /// Atualiza evento
  Future<bool> updateEvent(EventModel event) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _mockEvents.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      _mockEvents[index] = event;
      return true;
    }
    return false;
  }

  /// Deleta evento
  Future<bool> deleteEvent(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockEvents.removeWhere((event) => event.id == id);
    return true;
  }
}