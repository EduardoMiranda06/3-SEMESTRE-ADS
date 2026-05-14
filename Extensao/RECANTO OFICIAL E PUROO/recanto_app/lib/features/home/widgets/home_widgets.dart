import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';

/// Banner institucional principal
class HomeHeaderBanner extends StatelessWidget {
  final VoidCallback? onDonatePressed;
  final VoidCallback? onLearnMorePressed;

  const HomeHeaderBanner({
    Key? key,
    this.onDonatePressed,
    this.onLearnMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradientPrimary,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.radiusXLarge),
          bottomRight: Radius.circular(AppSpacing.radiusXLarge),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: 32.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo/Greeting
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            // Main title
            Text(
              'Bem-vindo ao',
              style: AppTextStyles.bodyMedium(
                color: AppColors.white,
              ),
            ),
            Text(
              'Recanto dos Velhinhos',
              style: AppTextStyles.displaySmall(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 8.h),
            // Subtitle
            Text(
              'Seu encontro de paz e dignidade na melhor fase da vida',
              style: AppTextStyles.bodyMedium(
                color: AppColors.white.withOpacity(0.9),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 20.h),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onLearnMorePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusSmall),
                      ),
                    ),
                    child: Text(
                      'Saiba Mais',
                      style: AppTextStyles.buttonText(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onDonatePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusSmall),
                      ),
                    ),
                    child: Text(
                      'Doar',
                      style: AppTextStyles.buttonText(),
                    ),
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

/// Seção com título e botão "Ver Mais"
class HomeSectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onViewMorePressed;

  const HomeSectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.onViewMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.headlineLarge(),
              ),
              if (subtitle != null) ...[
                SizedBox(height: 4.h),
                Text(
                  subtitle!,
                  style: AppTextStyles.bodySmall(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
          if (onViewMorePressed != null)
            TextButton(
              onPressed: onViewMorePressed,
              child: Text(
                'Ver Mais',
                style: AppTextStyles.labelMedium(
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Card destaque para notícia/evento na home
class HomeNewsCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const HomeNewsCard({
    Key? key,
    this.imageUrl,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.primaryVeryLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.radiusMedium),
                  topRight: Radius.circular(AppSpacing.radiusMedium),
                ),
              ),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.primaryVeryLight,
                          child: const Icon(
                            Icons.image,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: AppColors.primaryVeryLight,
                      child: const Icon(
                        Icons.image,
                        color: AppColors.primary,
                      ),
                    ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleMedium(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card de atalho rápido (menu items)
class HomeQuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const HomeQuickAccessCard({
    Key? key,
    required this.icon,
    required this.label,
    this.backgroundColor = AppColors.primaryVeryLight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.lg.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32.w,
              color: AppColors.primary,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: AppTextStyles.labelMedium(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Seção de estatísticas (números destacados)
class HomeStatsSection extends StatelessWidget {
  const HomeStatsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1,
        children: [
          _StatCard(
            number: '50+',
            label: 'Idosos',
            icon: Icons.people,
          ),
          _StatCard(
            number: '60+',
            label: 'Profissionais',
            icon: Icons.work,
          ),
          _StatCard(
            number: '50',
            label: 'Anos',
            icon: Icons.cake,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryVeryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: AppColors.border),
      ),
      padding: EdgeInsets.all(AppSpacing.md.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 24.w,
          ),
          SizedBox(height: 6.h),
          Text(
            number,
            style: AppTextStyles.headlineSmall(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTextStyles.labelSmall(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}