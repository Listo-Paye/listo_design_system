import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listo_design_system/listo_design_system.dart';

class CheckBoxWithText extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String text;

  const CheckBoxWithText({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  CheckBoxWithTextState createState() => CheckBoxWithTextState();
}

class CheckBoxWithTextState extends State<CheckBoxWithText> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Initialiser le FocusNode
    _focusNode = FocusNode();
    // Ajouter un écouteur pour détecter les changements de focus
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // Supprimer l'écouteur et disposer du FocusNode
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    // Reconstruire le widget lorsque le focus change
    setState(() {});
  }

  void _handleTap() {
    if (widget.onChanged != null) {
      bool? newValue;
      if (widget.value == null) {
        newValue = true;
      } else {
        newValue = !widget.value!;
      }
      widget.onChanged!(newValue);
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) {
        _handleTap();
        return KeyEventResult.handled; // Indique que l'événement a été traité
      }
    }
    return KeyEventResult.ignored; // Laisser les autres événements se propager
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    double borderWidth = 1.0;

    if (_focusNode.hasFocus) {
      // Modifier la couleur et l'épaisseur de la bordure lorsque le widget est focalisé
      borderColor = SepteoColors.blue.shade500;
      borderWidth = 2.0; // Bordure plus épaisse lorsque focalisé
    } else if (widget.value == null) {
      borderColor = SepteoColors.blue.shade700;
    } else if (widget.value == true) {
      borderColor = SepteoColors.blue.shade900;
    } else {
      borderColor = SepteoColors.grey.shade200;
    }

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: GestureDetector(
        onTap: _handleTap,
        child: Semantics(
          label: widget.text,
          checked: widget.value == true,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
            ),
            padding: const EdgeInsets.only(
              left: SepteoSpacings.xs,
              right: SepteoSpacings.xs,
              top: 6,
              bottom: 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CheckBox(
                  value: widget.value,
                  onChanged: widget.onChanged,
                ),
                const SizedBox(width: SepteoSpacings.xs),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.text,
                    style: SepteoTextStyles.bodySmallInter,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
