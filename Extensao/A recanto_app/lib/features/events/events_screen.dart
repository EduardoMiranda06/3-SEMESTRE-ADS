import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../home/providers/home_providers.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(allEventsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Eventos',
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: eventsAsync.when(
        data: (eventsList) {
          // Ordena por data
          final sorted = [...eventsList]
            ..sort((a, b) => a.startDate.compareTo(b.startDate));

          return ListView.separated(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            itemCount: sorted.length,
            separatorBuilder: (_, __) => SizedBox(height: AppSpacing.lg.h),
            itemBuilder: (context, index) {
              final event = sorted[index];
              return _EventCard(
                event: event,
                onTap: () => AppRouter.goToEventDetail(context, event.id),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64.w, color: AppColors.error),
              SizedBox(height: AppSpacing.lg.h),
              Text(
                'Erro ao carregar eventos',
                style: AppTextStyles.headlineMedium(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final dynamic event;
  final VoidCallback? onTap;

  const _EventCard({
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');
    final timeFormat = DateFormat('HH:mm', 'pt_BR');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status badge
            if (event.isUpcoming)
              Padding(
                padding: EdgeInsets.all(AppSpacing.lg.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md.w,
                    vertical: AppSpacing.sm.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusSmall),
                  ),
                  child: Text(
                    'PRÓXIMO',
                    style: AppTextStyles.labelSmall(
                      color: AppColors.success,
                    ),
                  ),
                ),
              )
            else if (event.isOngoing)
              Padding(
                padding: EdgeInsets.all(AppSpacing.lg.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md.w,
                    vertical: AppSpacing.sm.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusSmall),
                  ),
                  child: Text(
                    'ACONTECENDO AGORA',
                    style: AppTextStyles.labelSmall(
                      color: AppColors.info,
                    ),
                  ),
                ),
              ),
            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (event.isOngoing == false && event.isPast == false)
                    SizedBox(height: 0)
                  else
                    SizedBox(height: AppSpacing.lg.h),
                  // Título
                  Text(
                    event.title,
                    style: AppTextStyles.titleLarge(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  // Data e hora
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.w,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        dateFormat.format(event.startDate),
                        style: AppTextStyles.bodySmall(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.access_time,
                        size: 16.w,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        timeFormat.format(event.startDate),
                        style: AppTextStyles.bodySmall(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md.h),
                  // Local
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.w,
                        color: AppColors.secondary,
                      ),
                      SizedBox(width: 8.w),
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
                  SizedBox(height: AppSpacing.lg.h),
                  // Descrição
                  Text(
                    event.description,
                    style: AppTextStyles.bodySmall(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.lg.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}