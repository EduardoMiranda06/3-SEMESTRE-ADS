import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Sobre Nós',
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSpacing.lg.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.gradientPrimary,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 64.w,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Recanto dos Velhinhos',
                    style: AppTextStyles.displaySmall(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Mais de 50 anos acolhendo e cuidando',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Missão
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossa Missão',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  AppCardHighlight(
                    title: 'Acolhimento com Dignidade',
                    description:
                        'Acolher idosos em situação de vulnerabilidade, ofert oferecendo estrutura especializada, cuidados humanizados e ambiente seguro para garantir bem-estar e qualidade de vida.',
                    backgroundColor: AppColors.primaryVeryLight,
                    icon: Icons.favorite,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // História
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossa História',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fundação - 30 de Outubro de 1973',
                          style: AppTextStyles.headlineSmall(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: AppSpacing.lg.h),
                        Text(
                          'Há mais de cinco décadas, o Recanto dos Velhinhos de Valinhos é sinônimo de acolhimento, dignidade e cuidado com a melhor idade.\n\nFundado em 30 de outubro de 1973 por um grupo de cidadãos comprometidos com o bem comum, o Recanto nasceu do desejo de amparar idosos em situação de vulnerabilidade, sem distinção de raça, cor, condição social, crença ou convicção política.\n\nAtualmente acolhe 50 idosos e conta com uma equipe de mais de 60 profissionais especializados, além do apoio fundamental de voluntários.',
                          style: AppTextStyles.bodyMedium(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Estrutura
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossa Estrutura',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StructureItem(
                          icon: Icons.domain,
                          title: 'Localização',
                          description:
                              'R. João Bissoto Filho, 2061 - Ortizes, Valinhos - SP',
                        ),
                        Divider(height: 24.h, color: AppColors.divider),
                        _StructureItem(
                          icon: Icons.square_foot,
                          title: 'Área',
                          description: '32.185 m² doada pela Prefeitura',
                        ),
                        Divider(height: 24.h, color: AppColors.divider),
                        _StructureItem(
                          icon: Icons.home,
                          title: 'Quartos',
                          description: 'Duplos com banheiro privativo e TV',
                        ),
                        Divider(height: 24.h, color: AppColors.divider),
                        _StructureItem(
                          icon: Icons.spa,
                          title: 'Estrutura',
                          description:
                              'Espaço verde, refeitório, sala de TV, academia, fisioterapia',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Equipe
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossa Equipe',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 1.2,
                    children: [
                      _TeamCard(
                        icon: Icons.person_3,
                        title: 'Diretoria',
                        count: '1',
                      ),
                      _TeamCard(
                        icon: Icons.medical_services,
                        title: 'Médicos',
                        count: '3+',
                      ),
                      _TeamCard(
                        icon: Icons.healing,
                        title: 'Cuidadores',
                        count: '25+',
                      ),
                      _TeamCard(
                        icon: Icons.people,
                        title: 'Apoio',
                        count: '30+',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Valores
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nossos Valores',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  Column(
                    children: [
                      _ValueCard(
                        icon: Icons.favorite,
                        title: 'Acolhimento',
                        description: 'Receber com amor e dignidade',
                      ),
                      SizedBox(height: 12.h),
                      _ValueCard(
                        icon: Icons.security,
                        title: 'Segurança',
                        description: 'Garantir proteção e bem-estar',
                      ),
                      SizedBox(height: 12.h),
                      _ValueCard(
                        icon: Icons.handshake,
                        title: 'Solidariedade',
                        description: 'Trabalhar em comunidade',
                      ),
                      SizedBox(height: 12.h),
                      _ValueCard(
                        icon: Icons.lightbulb,
                        title: 'Excelência',
                        description: 'Oferecer o melhor cuidado',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xxl.h),
          ],
        ),
      ),
    );
  }
}

class _StructureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _StructureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.primaryVeryLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24.w),
        ),
        SizedBox(width: AppSpacing.lg.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.titleMedium(),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: AppTextStyles.bodySmall(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TeamCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;

  const _TeamCard({
    required this.icon,
    required this.title,
    required this.count,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 32.w),
          SizedBox(height: 8.h),
          Text(
            count,
            style: AppTextStyles.displaySmall(
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: AppTextStyles.labelSmall(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.w),
      decoration: BoxDecoration(
        color: AppColors.primaryVeryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 24.w),
          ),
          SizedBox(width: AppSpacing.lg.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleMedium(
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: AppTextStyles.bodySmall(
                    color: AppColors.textSecondary,
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