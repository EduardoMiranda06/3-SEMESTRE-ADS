import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// AppBar institucional padrão
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double elevation;
  final bool centerTitle;
  final Widget? leading;

  const AppAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    this.backgroundColor = AppColors.white,
    this.elevation = 0,
    this.centerTitle = false,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.headlineMedium(),
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
      foregroundColor: AppColors.textPrimary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

/// AppBar simplificado (apenas logo/título)
class AppAppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logo;
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AppAppBarSimple({
    Key? key,
    this.logo,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: logo ?? (title != null ? Text(title!) : null),
      centerTitle: true,
      foregroundColor: AppColors.textPrimary,
    );
  }
}

/// AppBar com imagem de fundo
class AppAppBarImage extends StatelessWidget implements PreferredSizeWidget {
  final String? imageUrl;
  final Widget? imagePlaceholder;
  final String title;
  final double height;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AppAppBarImage({
    Key? key,
    this.imageUrl,
    this.imagePlaceholder,
    required this.title,
    this.height = 200,
    this.showBackButton = false,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
        color: AppColors.primaryVeryLight,
      ),
      child: Stack(
        children: [
          // Overlay escuro
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Conteúdo
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Text(
                title,
                style: AppTextStyles.displaySmall(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          // Botão voltar
          if (showBackButton)
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              ),
            ),
        ],
      ),
    );
  }
}