/// Modelo de Atividade
class ActivityModel {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final String icon;
  final String category;
  final List<String> benefits;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.icon,
    required this.category,
    this.benefits = const [],
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      icon: json['icon'] as String,
      category: json['category'] as String,
      benefits: List<String>.from(json['benefits'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'icon': icon,
      'category': category,
      'benefits': benefits,
    };
  }
}

/// Modelo de Serviço
class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final String icon;
  final String category;
  final List<String> features;
  final String? schedule;
  final bool isAvailable;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.icon,
    required this.category,
    this.features = const [],
    this.schedule,
    this.isAvailable = true,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      icon: json['icon'] as String,
      category: json['category'] as String,
      features: List<String>.from(json['features'] as List? ?? []),
      schedule: json['schedule'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'icon': icon,
      'category': category,
      'features': features,
      'schedule': schedule,
      'isAvailable': isAvailable,
    };
  }
}