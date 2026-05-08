import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import 'providers/home_providers.dart';
import 'widgets/home_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBarSimple(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. Header Banner
            HomeHeaderBanner(
              onDonatePressed: () => AppRouter.goToDonations(context),
              onLearnMorePressed: () => AppRouter.goToAbout(context),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // 2. Estatísticas
            HomeStatsSection(),
            SizedBox(height: AppSpacing.xl.h),

            // 3. Atalhos Rápidos
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Navegação Rápida',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 1,
                    children: [
                      HomeQuickAccessCard(
                        icon: Icons.info_outline,
                        label: 'Sobre',
                        backgroundColor: AppColors.primaryVeryLight,
                        onTap: () => AppRouter.goToAbout(context),
                      ),
                      HomeQuickAccessCard(
                        icon: Icons.newspaper,
                        label: 'Notícias',
                        backgroundColor: AppColors.secondaryLight,
                        onTap: () => AppRouter.goToNews(context),
                      ),
                      HomeQuickAccessCard(
                        icon: Icons.calendar_today,
                        label: 'Eventos',
                        backgroundColor: AppColors.primaryVeryLight,
                        onTap: () => AppRouter.goToEvents(context),
                      ),
                      HomeQuickAccessCard(
                        icon: Icons.volunteer_activism,
                        label: 'Doações',
                        backgroundColor: AppColors.secondaryLight,
                        onTap: () => AppRouter.goToDonations(context),
                      ),
                      HomeQuickAccessCard(
                        icon: Icons.description,
                        label: 'Transparência',
                        backgroundColor: AppColors.primaryVeryLight,
                        onTap: () => AppRouter.goToTransparency(context),
                      ),
                      HomeQuickAccessCard(
                        icon: Icons.mail,
                        label: 'Contato',
                        backgroundColor: AppColors.secondaryLight,
                        onTap: () => AppRouter.goToContact(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // 4. Destaques - Notícias
            Padding(
              padding: EdgeInsets.only(top: AppSpacing.lg.h),
              child: _FeaturedNewsSection(),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // 5. Destaques - Eventos
            Padding(
              padding: EdgeInsets.only(top: AppSpacing.lg.h),
              child: _FeaturedEventsSection(),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // 6. Call to Action - Campanhas
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: _CampaignSection(),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // 7. Informações de Contato
            _ContactInfoSection(),
            SizedBox(height: AppSpacing.xl.h),

            // 8. Footer
            _FooterSection(),
          ],
        ),
      ),
    );
  }
}

/// Seção de Notícias em Destaque
class _FeaturedNewsSection extends ConsumerWidget {
  const _FeaturedNewsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(featuredNewsProvider);

    return newsAsync.when(
      data: (newsList) {
        if (newsList.isEmpty) {
          return const SizedBox.shrink();
        }

        final news = newsList.take(3).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSectionHeader(
              title: 'Notícias Recentes',
              subtitle: 'Acompanhe as novidades',
              onViewMorePressed: () => AppRouter.goToNews(context),
            ),
            SizedBox(height: AppSpacing.lg.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: news.length,
                separatorBuilder: (_, __) => SizedBox(height: AppSpacing.lg.h),
                itemBuilder: (context, index) {
                  final newsItem = news[index];
                  return HomeNewsCard(
                    imageUrl: newsItem.imageUrl,
                    title: newsItem.title,
                    subtitle: newsItem.description,
                    onTap: () => AppRouter.goToNewsDetail(context, newsItem.id),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: const CircularProgressIndicator(),
      ),
      error: (error, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Text('Erro ao carregar notícias: $error'),
      ),
    );
  }
}

/// Seção de Eventos em Destaque
class _FeaturedEventsSection extends ConsumerWidget {
  const _FeaturedEventsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(featuredEventsProvider);

    return eventsAsync.when(
      data: (eventsList) {
        if (eventsList.isEmpty) {
          return const SizedBox.shrink();
        }

        final events = eventsList.take(2).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSectionHeader(
              title: 'Próximos Eventos',
              subtitle: 'Confira o calendário',
              onViewMorePressed: () => AppRouter.goToEvents(context),
            ),
            SizedBox(height: AppSpacing.lg.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                separatorBuilder: (_, __) => SizedBox(height: AppSpacing.lg.h),
                itemBuilder: (context, index) {
                  final event = events[index];
                  return _EventCardHome(
                    event: event,
                    onTap: () => AppRouter.goToEventDetail(context, event.id),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: const CircularProgressIndicator(),
      ),
      error: (error, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Text('Erro ao carregar eventos: $error'),
      ),
    );
  }
}

/// Card de Evento para Home
class _EventCardHome extends StatelessWidget {
  final dynamic event;
  final VoidCallback? onTap;

  const _EventCardHome({
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Data
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md.w,
                vertical: AppSpacing.sm.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryVeryLight,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
              child: Text(
                event.startDate.toString().split(' ')[0],
                style: AppTextStyles.labelSmall(
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: AppSpacing.lg.h),
            // Título
            Text(
              event.title,
              style: AppTextStyles.titleLarge(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSpacing.md.h),
            // Local
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16.w,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    event.location,
                    style: AppTextStyles.bodySmall(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Seção de Campanhas
class _CampaignSection extends StatelessWidget {
  const _CampaignSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.gradientWarm,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Faça a Diferença',
            style: AppTextStyles.headlineLarge(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: AppSpacing.md.h),
          Text(
            'Sua ajuda nos permite garantir dignidade e cuidado para nossos residentes',
            style: AppTextStyles.bodyMedium(
              color: AppColors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: AppSpacing.lg.h),
          ElevatedButton(
            onPressed: () => AppRouter.goToDonations(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.secondary,
            ),
            child: Text(
              'Quero Ajudar',
              style: AppTextStyles.buttonText(
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Seção de Informações de Contato
class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entre em Contato',
            style: AppTextStyles.headlineLarge(),
          ),
          SizedBox(height: AppSpacing.lg.h),
          // Telefone
          Container(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            decoration: BoxDecoration(
              color: AppColors.primaryVeryLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.md.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: AppSpacing.lg.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Telefone',
                      style: AppTextStyles.labelSmall(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      '(19) 3829-8180',
                      style: AppTextStyles.titleMedium(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.lg.h),
          // Email
          Container(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.md.w),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.email,
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(width: AppSpacing.lg.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-mail',
                        style: AppTextStyles.labelSmall(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        'contato@recantodosvelhinhos.com.br',
                        style: AppTextStyles.bodySmall(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Footer
class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg.w,
        vertical: 32.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Recanto dos Velhinhos de Valinhos',
            style: AppTextStyles.titleMedium(
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Todos os direitos reservados © 2024',
            style: AppTextStyles.bodySmall(
              color: AppColors.textTertiary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'CNPJ: 44.637.601/0001-85',
            style: AppTextStyles.caption(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}