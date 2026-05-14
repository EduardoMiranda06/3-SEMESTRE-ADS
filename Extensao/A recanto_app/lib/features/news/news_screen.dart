import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_card.dart';
import '../home/providers/home_providers.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(allNewsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Notícias',
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: newsAsync.when(
        data: (newsList) {
          return ListView.separated(
            padding: EdgeInsets.all(AppSpacing.lg.w),
            itemCount: newsList.length,
            separatorBuilder: (_, __) => SizedBox(height: AppSpacing.lg.h),
            itemBuilder: (context, index) {
              final news = newsList[index];
              return AppCardImage(
                imageUrl: news.imageUrl,
                title: news.title,
                subtitle: news.author,
                description: news.description,
                onTap: () => AppRouter.goToNewsDetail(context, news.id),
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
                'Erro ao carregar notícias',
                style: AppTextStyles.headlineMedium(),
              ),
              SizedBox(height: AppSpacing.md.h),
              Text(
                error.toString(),
                style: AppTextStyles.bodySmall(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}