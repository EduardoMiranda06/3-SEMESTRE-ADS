import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/data/news_repository.dart';
import '../../../shared/data/event_repository.dart';
import '../../../shared/data/activity_repository.dart';
import '../../../shared/models/news_model.dart';
import '../../../shared/models/event_model.dart';
import '../../../shared/models/activity_model.dart';

// Repositories
final newsRepositoryProvider = Provider((ref) => NewsRepository());
final eventRepositoryProvider = Provider((ref) => EventRepository());
final activityRepositoryProvider = Provider((ref) => ActivityRepository());

// Featured News
final featuredNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final repository = ref.watch(newsRepositoryProvider);
  return await repository.getRecentNews(days: 30);
});

// Featured Events
final featuredEventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final repository = ref.watch(eventRepositoryProvider);
  return await repository.getUpcomingEventsInDays(30);
});

// All Activities
final activitiesProvider = FutureProvider<List<ActivityModel>>((ref) async {
  final repository = ref.watch(activityRepositoryProvider);
  return await repository.getAllActivities();
});

// All News
final allNewsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final repository = ref.watch(newsRepositoryProvider);
  return await repository.getAllNews();
});

// All Events
final allEventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final repository = ref.watch(eventRepositoryProvider);
  return await repository.getAllEvents();
});