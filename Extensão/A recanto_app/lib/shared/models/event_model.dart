/// Modelo de Evento
class EventModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String? imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String? organizer;
  final int? maxParticipants;
  final bool isFeatured;
  final List<String> tags;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.location,
    this.organizer,
    this.maxParticipants,
    this.isFeatured = false,
    this.tags = const [],
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      location: json['location'] as String,
      organizer: json['organizer'] as String?,
      maxParticipants: json['maxParticipants'] as int?,
      isFeatured: json['isFeatured'] as bool? ?? false,
      tags: List<String>.from(json['tags'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'imageUrl': imageUrl,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'location': location,
      'organizer': organizer,
      'maxParticipants': maxParticipants,
      'isFeatured': isFeatured,
      'tags': tags,
    };
  }

  bool get isUpcoming => startDate.isAfter(DateTime.now());
  bool get isOngoing =>
      startDate.isBefore(DateTime.now()) && endDate.isAfter(DateTime.now());
  bool get isPast => endDate.isBefore(DateTime.now());

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? imageUrl,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? organizer,
    int? maxParticipants,
    bool? isFeatured,
    List<String>? tags,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      location: location ?? this.location,
      organizer: organizer ?? this.organizer,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      isFeatured: isFeatured ?? this.isFeatured,
      tags: tags ?? this.tags,
    );
  }
}