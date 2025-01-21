import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

enum AlertStatus { success, info, warning, error }

class AlertBanner extends StatefulWidget {
  final String? title;
  final String text;
  final AlertStatus status;
  final Duration duration;
  final VoidCallback? onClose;

  const AlertBanner({
    super.key,
    this.title,
    required this.text,
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

    return Semantics(
      liveRegion: true, // Indique que ce widget doit être lu en temps réel.
      label: _buildSemanticsLabel(), // Label pour le lecteur d'écran.
      child: SizedBox(
        width: double.infinity,
        height: 74, // Hauteur fixe demandée
        child: SlideTransition(
          position: _slideAnimation,
          child: Material(
            borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
              ),
              padding: const EdgeInsets.all(SepteoSpacings.sm), // 12 px
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Partie gauche : soit titre + texte, soit juste texte
                  Expanded(
                    child: widget.title != null
                        ? _buildTitleAndText(textColor)
                        : _buildCenteredText(textColor),
                  ),
                  // Bouton de fermeture
                  IconButton(
                    icon: Icon(Icons.close, color: textColor),
                    onPressed: _closeBanner,
                    tooltip:
                        "Fermer la notification", // Tooltip pour l'accessibilité
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Crée un label descriptif pour les lecteurs d'écran
  String _buildSemanticsLabel() {
    final typeLabel = _mapStatusToString(widget.status);
    if (widget.title != null) {
      return "$typeLabel: ${widget.title}. ${widget.text}";
    }
    return "$typeLabel: ${widget.text}";
  }

  /// Méthode pour mapper le statut à une description textuelle
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

  /// Si un titre est fourni, on l’affiche au-dessus du texte,
  /// tous deux alignés sur la gauche.
  Widget _buildTitleAndText(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title!,
          style: SepteoTextStyles.bodySmallInter.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          widget.text,
          style: SepteoTextStyles.bodySmallInter.copyWith(
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  /// Sinon, on centre le texte verticalement/horizontalement
  Widget _buildCenteredText(Color textColor) {
    return Center(
      child: Text(
        widget.text,
        style: SepteoTextStyles.bodySmallInter.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Sélection de la couleur de fond en fonction du statut.
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

  /// Sélection de la couleur du texte en fonction du statut.
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
}
