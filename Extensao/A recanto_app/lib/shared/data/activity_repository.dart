import '../models/activity_model.dart';

/// Repositório de Atividades
class ActivityRepository {
  static final List<ActivityModel> _mockActivities = [
    ActivityModel(
      id: '1',
      title: 'Culinária',
      description: 'Momentos de interação e prazer em que os residentes colocam a mão na massa.',
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-65-1.png',
      icon: 'chef',
      category: 'Criatividade',
      benefits: [
        'Resgate de memórias',
        'Interação social',
        'Estimulação sensorial',
      ],
    ),
    ActivityModel(
      id: '2',
      title: 'Caminhada Assistida',
      description: 'Voluntários auxiliam os idosos que possuem dificuldades em caminhar sozinhos.',
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-53-768x563.png',
      icon: 'directions_walk',
      category: 'Saúde',
      benefits: [
        'Estimula autonomia',
        'Melhora autoestima',
        'Atividade física',
      ],
    ),
    ActivityModel(
      id: '3',
      title: 'Bingo',
      description: 'Um momento divertido de interação, risadas e socialização entre os idosos.',
      icon: 'casino',
      category: 'Diversão',
      benefits: [
        'Socialização',
        'Diversão',
        'Estimulação mental',
      ],
    ),
    ActivityModel(
      id: '4',
      title: 'Celebração Religiosa',
      description: 'Espaço de espiritualidade e fé, respeitando diferentes crenças.',
      icon: 'favorite',
      category: 'Espiritual',
      benefits: [
        'Paz espiritual',
        'Comunidade',
        'Equilíbrio emocional',
      ],
    ),
    ActivityModel(
      id: '5',
      title: 'Saindo da Rotina',
      description:
          'Passeios semanais organizados a diferentes locais da cidade e da região.',
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-47-e1758651085694.png',
      icon: 'landscape',
      category: 'Lazer',
      benefits: [
        'Novas experiências',
        'Conexão comunitária',
        'Alegria',
      ],
    ),
    ActivityModel(
      id: '6',
      title: 'Rodas de Conversa',
      description: 'Encontros que promovem a escuta, o diálogo e a troca de experiências de vida.',
      icon: 'forum',
      category: 'Social',
      benefits: [
        'Troca de experiências',
        'Vínculos emocionais',
        'Escuta ativa',
      ],
    ),
    ActivityModel(
      id: '7',
      title: 'Musicoterapia',
      description: 'A música como ferramenta de expressão, memória afetiva e equilíbrio emocional.',
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-77.png',
      icon: 'music_note',
      category: 'Terapia',
      benefits: [
        'Equilíbrio emocional',
        'Resgate de memória',
        'Expressão artística',
      ],
    ),
    ActivityModel(
      id: '8',
      title: 'Tampinha Legal',
      description: 'Projeto solidário que transforma tampinhas em recursos para apoiar o Recanto.',
      icon: 'favorite_border',
      category: 'Solidariedade',
      benefits: [
        'Ação solidária',
        'Sustentabilidade',
        'Ajuda institucional',
      ],
    ),
    ActivityModel(
      id: '9',
      title: 'Cinema em Casa',
      description: 'Sessões de filmes que trazem lazer, cultura e boas lembranças.',
      icon: 'local_movies',
      category: 'Cultura',
      benefits: [
        'Lazer',
        'Entretenimento',
        'Boas memórias',
      ],
    ),
  ];

  Future<List<ActivityModel>> getAllActivities() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockActivities;
  }

  Future<ActivityModel?> getActivityById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockActivities.firstWhere((activity) => activity.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<ActivityModel>> getActivitiesByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockActivities
        .where((activity) => activity.category == category)
        .toList();
  }

  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final categories = _mockActivities.map((a) => a.category).toSet().toList();
    return categories;
  }
}

/// Repositório de Serviços
class ServiceRepository {
  static final List<ServiceModel> _mockServices = [
    ServiceModel(
      id: '1',
      title: 'Assistência Médica',
      description: 'Assistência médica contínua, administração de medicamentos e acompanhamento da saúde.',
      icon: 'local_hospital',
      category: 'Saúde',
      features: [
        'Médico 24h disponível',
        'Medicamentos supervisionados',
        'Monitoramento de saúde',
      ],
    ),
    ServiceModel(
      id: '2',
      title: 'Acompanhamento 24 horas',
      description: 'Presença constante de profissionais capacitados garantindo segurança e cuidado integral.',
      imageUrl:
          'https://recantodosvelhinhos.com.br/wp-content/uploads/2025/09/RVV-70-e1758717610498.png',
      icon: 'security',
      category: 'Segurança',
      features: [
        'Profissionais treinados',
        'Vigilância constante',
        'Resposta rápida',
      ],
    ),
    ServiceModel(
      id: '3',
      title: 'Acompanhamento Nutricional',
      description: 'Refeições planejadas por nutricionista para atender às necessidades específicas.',
      icon: 'restaurant',
      category: 'Nutrição',
      features: [
        'Nutricionista especialista',
        'Dietas personalizadas',
        'Refeições balanceadas',
      ],
    ),
    ServiceModel(
      id: '4',
      title: 'Acompanhamento Psicossocial',
      description: 'Apoio emocional e social com escuta ativa e fortalecimento de vínculos.',
      icon: 'psychology',
      category: 'Mental',
      features: [
        'Escuta ativa',
        'Apoio emocional',
        'Integração social',
      ],
    ),
    ServiceModel(
      id: '5',
      title: 'Academia',
      description: 'Exercícios orientados que fortalecem o corpo e auxiliam na autonomia.',
      icon: 'fitness_center',
      category: 'Fitness',
      features: [
        'Exercícios orientados',
        'Equipamentos modernos',
        'Treinador especializado',
      ],
    ),
    ServiceModel(
      id: '6',
      title: 'Fisioterapia',
      description: 'Exercícios orientados que fortalecem o corpo e auxiliam na autonomia.',
      icon: 'healing',
      category: 'Reabilitação',
      features: [
        'Sessões supervisionadas',
        'Recuperação motora',
        'Fortalecimento',
      ],
    ),
    ServiceModel(
      id: '7',
      title: 'Atendimento Psicológico',
      description: 'Apoio especializado para cuidar da saúde emocional e qualidade de vida.',
      icon: 'sentiment_satisfied',
      category: 'Mental',
      features: [
        'Psicólogo especialista',
        'Sessões personalizadas',
        'Suporte emocional',
      ],
    ),
    ServiceModel(
      id: '8',
      title: 'Serviço Social',
      description: 'Atendimento humanizado que promove direitos, acolhimento e integração social.',
      icon: 'people',
      category: 'Social',
      features: [
        'Atendimento humanizado',
        'Defesa de direitos',
        'Integração comunitária',
      ],
    ),
    ServiceModel(
      id: '9',
      title: 'Arteterapia',
      description: 'Atividades artísticas que estimulam a criatividade e contribuem para bem-estar.',
      icon: 'palette',
      category: 'Arte',
      features: [
        'Atividades criativas',
        'Expressão artística',
        'Bem-estar emocional',
      ],
    ),
  ];

  Future<List<ServiceModel>> getAllServices() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockServices;
  }

  Future<ServiceModel?> getServiceById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mockServices.firstWhere((service) => service.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<ServiceModel>> getServicesByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockServices
        .where((service) => service.category == category)
        .toList();
  }

  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final categories = _mockServices.map((s) => s.category).toSet().toList();
    return categories;
  }
}

// Importar ServiceModel se não estiver no mesmo arquivo
import '../models/activity_model.dart' show ServiceModel;