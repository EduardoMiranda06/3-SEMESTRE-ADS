import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../shared/data/news_repository.dart';

class NewsDetailScreen extends ConsumerWidget {
  final String newsId;

  const NewsDetailScreen({
    Key? key,
    required this.newsId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsRepository = NewsRepository();

    return FutureBuilder(
      future: newsRepository.getNewsById(newsId),
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
              title: 'Notícia não encontrada',
              showBackButton: true,
            ),
            body: Center(
              child: Text(
                'Notícia não encontrada',
                style: AppTextStyles.headlineMedium(),
              ),
            ),
          );
        }

        final news = snapshot.data!;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              // App bar customizado com imagem
              if (news.imageUrl != null)
                SliverAppBar(
                  expandedHeight: 250.h,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      news.imageUrl!,
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
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              if (news.imageUrl == null)
                SliverAppBar(
                  title: Text(news.title),
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
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
                      // Autor e data
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primaryVeryLight,
                            child: Icon(
                              Icons.person,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: AppSpacing.lg.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.author,
                                style: AppTextStyles.titleMedium(),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                news.publishedAt.toString().split(' ')[0],
                                style: AppTextStyles.bodySmall(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xl.h),
                      // Título
                      Text(
                        news.title,
                        style: AppTextStyles.displayMedium(),
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      // Tags
                      if (news.tags.isNotEmpty) ...[
                        Wrap(
                          spacing: AppSpacing.sm.w,
                          children: news.tags
                              .map(
                                (tag) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSpacing.md.w,
                                    vertical: AppSpacing.sm.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryVeryLight,
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusSmall,
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    style: AppTextStyles.labelSmall(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: AppSpacing.xl.h),
                      ],
                      // Conteúdo
                      Text(
                        news.content,
                        style: AppTextStyles.bodyMedium(
                          color: AppColors.textPrimary,
                        ),
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