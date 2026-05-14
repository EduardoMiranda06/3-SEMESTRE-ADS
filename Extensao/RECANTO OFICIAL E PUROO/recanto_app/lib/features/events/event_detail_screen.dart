import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_button.dart';
import '../../shared/data/event_repository.dart';

class EventDetailScreen extends ConsumerWidget {
  final String eventId;

  const EventDetailScreen({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventRepository = EventRepository();

    return FutureBuilder(
      future: eventRepository.getEventById(eventId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppAppBar(
              title: 'Carregando...',
              showBackButton: true,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(
            appBar: AppAppBar(
              title: 'Evento não encontrado',
              showBackButton: true,
            ),
            body: Center(
              child: Text(
                'Evento não encontrado',
                style: AppTextStyles.headlineMedium(),
              ),
            ),
          );
        }

        final event = snapshot.data!;
        final dateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');
        final timeFormat = DateFormat('HH:mm', 'pt_BR');

        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              // App bar
              SliverAppBar(
                expandedHeight: 200.h,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: AppColors.primaryVeryLight,
                    child: Stack(
                      children: [
                        if (event.imageUrl != null)
                          Image.network(
                            event.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.primaryVeryLight,
                                child: const Icon(
                                  Icons.event,
                                  color: AppColors.primary,
                                  size: 64,
                                ),
                              );
                            },
                          ),
                        Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(4.w),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // Conteúdo
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.lg.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status
                      if (event.isUpcoming)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md.w,
                            vertical: AppSpacing.sm.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusSmall,
                            ),
                          ),
                          child: Text(
                            'PRÓXIMO EVENTO',
                            style: AppTextStyles.labelSmall(
                              color: AppColors.success,
                            ),
                          ),
                        )
                      else if (event.isOngoing)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md.w,
                            vertical: AppSpacing.sm.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusSmall,
                            ),
                          ),
                          child: Text(
                            'ACONTECENDO AGORA',
                            style: AppTextStyles.labelSmall(
                              color: AppColors.info,
                            ),
                          ),
                        )
                      else
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md.w,
                            vertical: AppSpacing.sm.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textTertiary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusSmall,
                            ),
                          ),
                          child: Text(
                            'EVENTO PASSADO',
                            style: AppTextStyles.labelSmall(
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ),
                      SizedBox(height: AppSpacing.lg.h),
                      // Título
                      Text(
                        event.title,
                        style: AppTextStyles.displayMedium(),
                      ),
                      SizedBox(height: AppSpacing.xl.h),
                      // Informações principais
                      _InfoCard(
                        icon: Icons.calendar_today,
                        title: 'Data',
                        value:
                            '${dateFormat.format(event.startDate)} a ${dateFormat.format(event.endDate)}',
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      _InfoCard(
                        icon: Icons.access_time,
                        title: 'Horário',
                        value: timeFormat.format(event.startDate),
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      _InfoCard(
                        icon: Icons.location_on,
                        title: 'Local',
                        value: event.location,
                      ),
                      if (event.organizer != null) ...[
                        SizedBox(height: AppSpacing.lg.h),
                        _InfoCard(
                          icon: Icons.person,
                          title: 'Organizador',
                          value: event.organizer!,
                        ),
                      ],
                      SizedBox(height: AppSpacing.xl.h),
                      // Descrição
                      Text(
                        'Sobre o Evento',
                        style: AppTextStyles.headlineLarge(),
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      Text(
                        event.description,
                        style: AppTextStyles.bodyMedium(),
                      ),
                      SizedBox(height: AppSpacing.xl.h),
                      // Conteúdo detalhado
                      Text(
                        event.content,
                        style: AppTextStyles.bodyMedium(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.xl.h),
                      // Tags
                      if (event.tags.isNotEmpty) ...[
                        Text(
                          'Categorias',
                          style: AppTextStyles.headlineLarge(),
                        ),
                        SizedBox(height: AppSpacing.lg.h),
                        Wrap(
                          spacing: AppSpacing.sm.w,
                          children: event.tags
                              .map(
                                (tag) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSpacing.md.w,
                                    vertical: AppSpacing.sm.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryLight,
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusSmall,
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    style: AppTextStyles.labelSmall(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: AppSpacing.xl.h),
                      ],
                      // Botão de ação
                      AppButton(
                        label: 'Quero Participar',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Interessado no evento? Entre em contato conosco!',
                                style: AppTextStyles.bodyMedium(
                                  color: AppColors.white,
                                ),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppSpacing.xxxl.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.primaryVeryLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20.w),
          ),
          SizedBox(width: AppSpacing.lg.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelSmall(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: AppTextStyles.bodyMedium(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}