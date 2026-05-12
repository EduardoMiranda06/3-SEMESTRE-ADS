import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  void _launchWhatsApp() async {
    const whatsappUrl = 'https://wa.me/551938298180';
    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    }
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'contato@recantodosvelhinhos.com.br',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Doações',
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
                  colors: AppColors.gradientWarm,
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
                    'Sua Generosidade Importa',
                    style: AppTextStyles.displaySmall(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Ajude-nos a cuidar de quem mais precisa',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Por que Doar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Por Que Sua Doação Importa?',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  _ImportanceCard(
                    icon: Icons.medical_services,
                    title: 'Saúde e Cuidados',
                    description:
                        'Medicamentos, consultas e acompanhamento médico especializado',
                  ),
                  SizedBox(height: 12.h),
                  _ImportanceCard(
                    icon: Icons.restaurant,
                    title: 'Alimentação',
                    description:
                        'Refeições balanceadas e nutritivas planejadas por especialistas',
                  ),
                  SizedBox(height: 12.h),
                  _ImportanceCard(
                    icon: Icons.school,
                    title: 'Atividades e Lazer',
                    description:
                        'Programas terapêuticos, culturais e recreativos',
                  ),
                  SizedBox(height: 12.h),
                  _ImportanceCard(
                    icon: Icons.construction,
                    title: 'Infraestrutura',
                    description: 'Manutenção e melhorias das instalações',
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Formas de Doação
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Formas de Doação',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                ],
              ),
            ),

            // Doação Financeira
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: _DonationMethodCard(
                icon: Icons.monetization_on,
                title: 'Doação Financeira',
                description: 'Contribuição em dinheiro para manutenção e operação',
                items: [
                  'Doações únicas',
                  'Doações recorrentes',
                  'PIX',
                  'Transferência bancária',
                ],
                onTap: () => _launchWhatsApp(),
              ),
            ),
            SizedBox(height: 12.h),

            // Doação de Produtos
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: _DonationMethodCard(
                icon: Icons.shopping_bag,
                title: 'Doação de Produtos',
                description: 'Alimentos, roupas, higiene e itens essenciais',
                items: [
                  'Alimentos não-perecíveis',
                  'Itens de higiene pessoal',
                  'Roupas e calçados',
                  'Produtos para limpeza',
                ],
                onTap: () => _launchWhatsApp(),
              ),
            ),
            SizedBox(height: 12.h),

            // Bazar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: _DonationMethodCard(
                icon: Icons.storefront,
                title: 'Bazar do Recanto',
                description: 'Compre artigos doados e ajude',
                items: [
                  'Quartas-feiras',
                  '13:30 às 17:00 horas',
                  'Local: Recanto dos Velhinhos',
                  'Renda reverter para manutenção',
                ],
                onTap: () => _launchWhatsApp(),
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // CTA principal
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                children: [
                  AppButton(
                    label: 'Falar com Gestor de Doações',
                    icon: Icons.whatsapp,
                    onPressed: _launchWhatsApp,
                  ),
                  SizedBox(height: 12.h),
                  AppButtonSecondary(
                    label: 'Enviar E-mail',
                    icon: Icons.email,
                    onPressed: _launchEmail,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Informações Fiscais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Container(
                padding: EdgeInsets.all(AppSpacing.lg.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryVeryLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informações Fiscais',
                      style: AppTextStyles.headlineSmall(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg.h),
                    _InfoRow(
                      label: 'Razão Social:',
                      value: 'Recanto dos Velhinhos de Valinhos',
                    ),
                    SizedBox(height: AppSpacing.md.h),
                    _InfoRow(
                      label: 'CNPJ:',
                      value: '44.637.601/0001-85',
                    ),
                    SizedBox(height: AppSpacing.md.h),
                    Text(
                      'Somos uma instituição filantrópica sem fins lucrativos. Suas doações podem ser deduzidas do imposto de renda.',
                      style: AppTextStyles.bodySmall(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSpacing.xxxl.h),
          ],
        ),
      ),
    );
  }
}

class _ImportanceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ImportanceCard({
    required this.icon,
    required this.title,
    required this.description,
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
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
            ),
            child: Icon(icon, color: AppColors.secondary, size: 24.w),
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
      ),
    );
  }
}

class _DonationMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> items;
  final VoidCallback? onTap;

  const _DonationMethodCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.items,
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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryVeryLight,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusSmall),
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
            ),
            SizedBox(height: AppSpacing.lg.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 16.w,
                            color: AppColors.success,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTextStyles.bodySmall(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.titleSmall(
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium(),
          ),
        ),
      ],
    );
  }
}

import '../../core/widgets/app_button.dart';