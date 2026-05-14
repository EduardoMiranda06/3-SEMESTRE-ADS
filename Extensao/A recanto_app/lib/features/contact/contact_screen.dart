import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_app_bar.dart';
import '../../core/widgets/app_button.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _messageController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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

  void _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '551938298180',
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchMap() async {
    const mapUrl = 'https://maps.app.goo.gl/LCRgWUGWDYnpagaE7';
    if (await canLaunchUrl(Uri.parse(mapUrl))) {
      await launchUrl(Uri.parse(mapUrl));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simula envio do formulário
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);

        // Limpa formulário
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();

        // Mostra mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Mensagem enviada com sucesso!',
              style: AppTextStyles.bodyMedium(color: AppColors.white),
            ),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Contato',
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
                    Icons.mail,
                    size: 64.w,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Entre em Contato',
                    style: AppTextStyles.displaySmall(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Estamos sempre prontos para ouvi-lo',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Informações de Contato Direto
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contato Direto',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  _ContactMethodCard(
                    icon: Icons.phone,
                    title: 'Telefone',
                    value: '(19) 3829-8180',
                    onTap: _launchPhone,
                  ),
                  SizedBox(height: 12.h),
                  _ContactMethodCard(
                    icon: Icons.whatsapp,
                    title: 'WhatsApp',
                    value: '(19) 98329-8180',
                    onTap: _launchWhatsApp,
                  ),
                  SizedBox(height: 12.h),
                  _ContactMethodCard(
                    icon: Icons.email,
                    title: 'E-mail',
                    value: 'contato@recantodosvelhinhos.com.br',
                    onTap: _launchEmail,
                  ),
                  SizedBox(height: 12.h),
                  _ContactMethodCard(
                    icon: Icons.location_on,
                    title: 'Localização',
                    value: 'R. João Bissoto Filho, 2061 - Ortizes',
                    onTap: _launchMap,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Horários
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Horários de Atendimento',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.lg.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        _HorarioItem(
                          dia: 'Segunda à Sexta',
                          horario: '08:00 - 18:00',
                        ),
                        Divider(height: 24.h, color: AppColors.divider),
                        _HorarioItem(
                          dia: 'Sábado',
                          horario: '08:00 - 12:00',
                        ),
                        Divider(height: 24.h, color: AppColors.divider),
                        _HorarioItem(
                          dia: 'Domingo',
                          horario: 'Fechado',
                          isClosed: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Formulário de Contato
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Envie uma Mensagem',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Nome
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nome Completo',
                            hintText: 'Ex: João Silva',
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu nome';
                            }
                            if (value.length < 3) {
                              return 'Nome deve ter pelo menos 3 caracteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppSpacing.lg.h),

                        // Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'seu.email@exemplo.com',
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu e-mail';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Por favor, insira um e-mail válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppSpacing.lg.h),

                        // Telefone
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Telefone (Opcional)',
                            hintText: '(19) 9999-9999',
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: AppSpacing.lg.h),

                        // Mensagem
                        TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            labelText: 'Mensagem',
                            hintText: 'Escreva sua mensagem aqui...',
                            prefixIcon: const Icon(Icons.message),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, escreva uma mensagem';
                            }
                            if (value.length < 10) {
                              return 'Mensagem deve ter pelo menos 10 caracteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppSpacing.xl.h),

                        // Botão Enviar
                        AppButton(
                          label: 'Enviar Mensagem',
                          onPressed: _submitForm,
                          isLoading: _isLoading,
                          isEnabled: !_isLoading,
                          icon: Icons.send,
                          iconOnRight: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl.h),

            // Mapa
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visite-nos',
                    style: AppTextStyles.headlineLarge(),
                  ),
                  SizedBox(height: AppSpacing.lg.h),
                  GestureDetector(
                    onTap: _launchMap,
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryVeryLight,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.map,
                            size: 80.w,
                            color: AppColors.primary.withOpacity(0.3),
                          ),
                          Positioned(
                            bottom: AppSpacing.lg.w,
                            left: AppSpacing.lg.w,
                            right: AppSpacing.lg.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recanto dos Velhinhos',
                                  style: AppTextStyles.titleMedium(),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'R. João Bissoto Filho, 2061 - Valinhos, SP',
                                  style: AppTextStyles.bodySmall(
                                    color: AppColors.textSecondary,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: AppSpacing.lg.w,
                            right: AppSpacing.lg.w,
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_outward,
                                color: AppColors.white,
                                size: 20.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xxxl.h),
          ],
        ),
      ),
    );
  }
}

class _ContactMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactMethodCard({
    required this.icon,
    required this.title,
    required this.value,
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

class _HorarioItem extends StatelessWidget {
  final String dia;
  final String horario;
  final bool isClosed;

  const _HorarioItem({
    required this.dia,
    required this.horario,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dia,
          style: AppTextStyles.bodyMedium(),
        ),
        Text(
          horario,
          style: AppTextStyles.bodyMedium(
            color: isClosed ? AppColors.error : AppColors.success,
          ),
        ),
      ],
    );
  }
}