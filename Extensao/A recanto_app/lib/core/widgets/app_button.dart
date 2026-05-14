import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Botão primário customizado
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final IconData? icon;
  final bool iconOnRight;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.icon,
    this.iconOnRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: AppSpacing.buttonHeight,
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.white,
                  ),
                  strokeWidth: 2,
                ),
              )
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final textWidget = Text(label, style: AppTextStyles.buttonText());

    if (icon == null) {
      return textWidget;
    }

    final iconWidget = Icon(icon, size: 20);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconOnRight
          ? [textWidget, const SizedBox(width: 8), iconWidget]
          : [iconWidget, const SizedBox(width: 8), textWidget],
    );
  }
}

/// Botão secundário (outline)
class AppButtonSecondary extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final IconData? icon;
  final bool iconOnRight;

  const AppButtonSecondary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.icon,
    this.iconOnRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: AppSpacing.buttonHeight,
      child: OutlinedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                  strokeWidth: 2,
                ),
              )
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final textWidget = Text(
      label,
      style: AppTextStyles.buttonText(
        color: AppColors.primary,
      ),
    );

    if (icon == null) {
      return textWidget;
    }

    final iconWidget = Icon(
      icon,
      size: 20,
      color: AppColors.primary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconOnRight
          ? [textWidget, const SizedBox(width: 8), iconWidget]
          : [iconWidget, const SizedBox(width: 8), textWidget],
    );
  }
}

/// Botão texto
class AppButtonText extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const AppButtonText({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

/// Botão pequeno
class AppButtonSmall extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;

  const AppButtonSmall({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.buttonHeightSmall,
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        child: isLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.white,
                  ),
                  strokeWidth: 1.5,
                ),
              )
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final textWidget = Text(
      label,
      style: AppTextStyles.labelMedium(
        color: AppColors.white,
      ),
    );

    if (icon == null) {
      return textWidget;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.white),
        const SizedBox(width: 4),
        textWidget,
      ],
    );
  }
}

/// Botão com ícone (icônico)
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double size;
  final bool filled;

  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = AppColors.primary,
    this.size = 24,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!filled) {
      return IconButton(
        icon: Icon(icon, color: color, size: size),
        onPressed: onPressed,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: size),
        onPressed: onPressed,
      ),
    );
  }
}