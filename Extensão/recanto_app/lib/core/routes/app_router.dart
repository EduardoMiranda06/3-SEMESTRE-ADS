import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/about/about_screen.dart';
import '../../features/news/news_screen.dart';
import '../../features/news/news_detail_screen.dart';
import '../../features/events/events_screen.dart';
import '../../features/events/event_detail_screen.dart';
import '../../features/donations/donations_screen.dart';
import '../../features/transparency/transparency_screen.dart';
import '../../features/contact/contact_screen.dart';

/// Configuração de rotas GoRouter
final goRouterProvider = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          const Text('Página não encontrada'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.goNamed('home'),
            child: const Text('Voltar para Home'),
          ),
        ],
      ),
    ),
  ),
  routes: [
    // Splash Screen
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    
    // Home e sub-rotas
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // About
        GoRoute(
          path: 'about',
          name: 'about',
          builder: (context, state) => const AboutScreen(),
        ),
        
        // News
        GoRoute(
          path: 'news',
          name: 'news',
          builder: (context, state) => const NewsScreen(),
          routes: [
            GoRoute(
              path: ':id',
              name: 'news-detail',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return NewsDetailScreen(newsId: id);
              },
            ),
          ],
        ),
        
        // Events
        GoRoute(
          path: 'events',
          name: 'events',
          builder: (context, state) => const EventsScreen(),
          routes: [
            GoRoute(
              path: ':id',
              name: 'event-detail',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return EventDetailScreen(eventId: id);
              },
            ),
          ],
        ),
        
        // Donations
        GoRoute(
          path: 'donations',
          name: 'donations',
          builder: (context, state) => const DonationsScreen(),
        ),
        
        // Transparency
        GoRoute(
          path: 'transparency',
          name: 'transparency',
          builder: (context, state) => const TransparencyScreen(),
        ),
        
        // Contact
        GoRoute(
          path: 'contact',
          name: 'contact',
          builder: (context, state) => const ContactScreen(),
        ),
      ],
    ),
  ],
);

/// Helper para navegar
class AppRouter {
  static void goToHome(BuildContext context) {
    context.goNamed('home');
  }

  static void goToAbout(BuildContext context) {
    context.goNamed('about');
  }

  static void goToNews(BuildContext context) {
    context.goNamed('news');
  }

  static void goToNewsDetail(BuildContext context, String id) {
    context.goNamed('news-detail', pathParameters: {'id': id});
  }

  static void goToEvents(BuildContext context) {
    context.goNamed('events');
  }

  static void goToEventDetail(BuildContext context, String id) {
    context.goNamed('event-detail', pathParameters: {'id': id});
  }

  static void goToDonations(BuildContext context) {
    context.goNamed('donations');
  }

  static void goToTransparency(BuildContext context) {
    context.goNamed('transparency');
  }

  static void goToContact(BuildContext context) {
    context.goNamed('contact');
  }
}