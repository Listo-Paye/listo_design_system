import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum AlertStatus { success, info, warning, error }

class AlertBanner extends StatefulWidget {
  final String title;
  final String? text;
  final AlertStatus status;
  final Duration duration;
  final VoidCallback? onClose;

  const AlertBanner({
    super.key,
    this.text,
    required this.title,
    required this.status,
    required this.duration,
    this.onClose,
  });

  @override
  State<AlertBanner> createState() => _AlertBannerState();
}

class _AlertBannerState extends State<AlertBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;
  Timer? _closeTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
    _closeTimer = Timer(widget.duration, _closeBanner);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _closeTimer?.cancel();
    super.dispose();
  }

  void _closeBanner() {
    _animationController.reverse().then((_) {
      widget.onClose?.call();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _getBackgroundColorFromStatus(widget.status);
    final Color textColor = _getTextColorFromStatus(widget.status);
    final Color borderColor = _getBorderColorFromStatus(widget.status);

    return Semantics(
      liveRegion: true,
      label: _buildSemanticsLabel(),
      child: Container(
        padding: const EdgeInsets.only(
            top: SepteoSpacings.lg,
            left: SepteoSpacings.xxl,
            right: SepteoSpacings.xxl),
        child: SizedBox(
          width: double.infinity,
          height: 74,
          child: SlideTransition(
            position: _slideAnimation,
            child: Material(
              borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
                ),
                padding: const EdgeInsets.all(SepteoSpacings.sm),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: widget.text != null
                          ? _buildTitleAndText(textColor)
                          : _buildCenteredTitle(textColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: textColor),
                      onPressed: _closeBanner,
                      tooltip: "Fermer la notification",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _buildSemanticsLabel() {
    final typeLabel = _mapStatusToString(widget.status);
    if (widget.text != null) {
      return "$typeLabel: ${widget.title}. ${widget.text}";
    }
    return "$typeLabel: ${widget.title}";
  }

  String _mapStatusToString(AlertStatus status) {
    switch (status) {
      case AlertStatus.success:
        return "Succès";
      case AlertStatus.info:
        return "Information";
      case AlertStatus.warning:
        return "Avertissement";
      case AlertStatus.error:
        return "Erreur";
    }
  }

  Widget _buildTitleAndText(Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: SepteoTextStyles.bodySmallInter.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          widget.text!,
          style: SepteoTextStyles.bodySmallInter.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildCenteredTitle(Color textColor) {
    return Center(
      child: Text(
        widget.title,
        style: SepteoTextStyles.bodySmallInter.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color _getBackgroundColorFromStatus(AlertStatus status) {
    switch (status) {
      case AlertStatus.success:
        return SepteoColors.green.shade50;
      case AlertStatus.info:
        return SepteoColors.purple.shade50;
      case AlertStatus.warning:
        return SepteoColors.orange.shade50;
      case AlertStatus.error:
        return SepteoColors.red.shade50;
    }
  }

  Color _getTextColorFromStatus(AlertStatus status) {
    switch (status) {
      case AlertStatus.success:
        return SepteoColors.green.shade800;
      case AlertStatus.info:
        return SepteoColors.purple.shade800;
      case AlertStatus.warning:
        return SepteoColors.orange.shade800;
      case AlertStatus.error:
        return SepteoColors.red.shade800;
    }
  }

  Color _getBorderColorFromStatus(AlertStatus status) {
    switch (status) {
      case AlertStatus.success:
        return SepteoColors.green.shade400;
      case AlertStatus.info:
        return SepteoColors.purple.shade400;
      case AlertStatus.warning:
        return SepteoColors.orange.shade400;
      case AlertStatus.error:
        return SepteoColors.red.shade600;
    }
  }
}
