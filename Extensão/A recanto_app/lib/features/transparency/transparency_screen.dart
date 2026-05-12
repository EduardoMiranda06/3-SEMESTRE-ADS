import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_card.dart';

class TransparencyScreen extends StatelessWidget {
  const TransparencyScreen({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Portal da Transparência',
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
                    Icons.description,
                    size: 64.w,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Compromisso com a Transparência',
                    style: AppTextStyles.displaySmall(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Informações claras e atualizadas sobre nossa gestão',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Introdução
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre o Portal',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.lg.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryVeryLight,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      'No Portal da Transparência do Recanto dos Velhinhos de Valinhos, você encontra informações claras e atualizadas sobre nossa gestão, investimentos, relatórios e prestações de contas. Nosso compromisso é garantir transparência, ética e responsabilidade em todas as ações.',
                      style: AppTextStyles.bodyMedium(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Documentos
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documentos Institucionais',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  _DocumentCard(
                    icon: Icons.description,
                    title: 'Estatuto Social',
                    description: 'Documento que rege a instituição',
                    onTap: () => _launchUrl(
                      'https://recantodosvelhinhos.com.br/portal-da-transparencia/',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _DocumentCard(
                    icon: Icons.rule,
                    title: 'Regimento Interno',
                    description: 'Normas e procedimentos internos',
                    onTap: () => _launchUrl(
                      'https://recantodosvelhinhos.com.br/portal-da-transparencia/',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _DocumentCard(
                    icon: Icons.handshake,
                    title: 'Termo de Colaboração',
                    description: 'Acordo com órgãos públicos',
                    onTap: () => _launchUrl(
                      'https://recantodosvelhinhos.com.br/portal-da-transparencia/',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _DocumentCard(
                    icon: Icons.verified,
                    title: 'Certificados e Licenças',
                    description: 'Validações e autorizações',
                    onTap: () => _launchUrl(
                      'https://recantodosvelhinhos.com.br/portal-da-transparencia/',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Informações Financeiras
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações Financeiras',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  _FinancialCard(
                    period: '2024',
                    status: 'Disponível',
                    statusColor: AppColors.success,
                  ),
                  SizedBox(height: 12.h),
                  _FinancialCard(
                    period: '2023',
                    status: 'Arquivado',
                    statusColor: AppColors.textSecondary,
                  ),
                  SizedBox(height: 12.h),
                  _FinancialCard(
                    period: '2022',
                    status: 'Arquivado',
                    statusColor: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Responsabilidade Social
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compromisso Social',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  _CommitmentCard(
                    icon: Icons.people,
                    title: 'Inclusão',
                    description: 'Acessibilidade para todos os públicos',
                  ),
                  SizedBox(height: 12.h),
                  _CommitmentCard(
                    icon: Icons.eco,
                    title: 'Sustentabilidade',
                    description: 'Práticas ambientalmente responsáveis',
                  ),
                  SizedBox(height: 12.h),
                  _CommitmentCard(
                    icon: Icons.balance,
                    title: 'Ética',
                    description: 'Gestão íntegra e respeitosa',
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Dúvidas
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Container(
                padding: EdgeInsets.all(AppSpacing.lg.w),
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tem Dúvidas?',
                      style: AppTextStyles.headlineSmall(
                        color: AppColors.secondary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg.h),
                    Text(
                      'Entre em contato conosco para mais informações sobre nossa gestão e transparência.',
                      style: AppTextStyles.bodySmall(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _launchUrl('https://wa.me/551938298180'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                            ),
                            child: Text(
                              'WhatsApp',
                              style: AppTextStyles.buttonText(),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _launchUrl(
                              'mailto:contato@recantodosvelhinhos.com.br',
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              'E-mail',
                              style: AppTextStyles.buttonText(),
                            ),
                          ),
                        ),
                      ],
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

class _DocumentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const _DocumentCard({
    required this.icon,
    required this.title,
    required this.description,
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
        child: Row(
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
            Icon(
              Icons.arrow_forward,
              color: AppColors.textTertiary,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}

class _FinancialCard extends StatelessWidget {
  final String period;
  final String status;
  final Color statusColor;

  const _FinancialCard({
    required this.period,
    required this.status,
    required this.statusColor,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Relatório Financeiro',
                style: AppTextStyles.titleMedium(),
              ),
              SizedBox(height: 4.h),
              Text(
                'Período: $period',
                style: AppTextStyles.bodySmall(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md.w,
              vertical: AppSpacing.sm.h,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
            ),
            child: Text(
              status,
              style: AppTextStyles.labelSmall(
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CommitmentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _CommitmentCard({
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