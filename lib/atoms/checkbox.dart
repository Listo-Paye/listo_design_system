import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class CheckBox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  const CheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  void _handleTap() {
    if (onChanged != null) {
      bool? newValue;
      if (value == null) {
        newValue = true; // Passe à true si la valeur est null
      } else {
        newValue = !value!; // Alterne entre true et false
      }
      onChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color checkboxColor;
    Widget? iconWidget;

    if (value == null) {
      checkboxColor = SepteoColors.blue.shade700; // Couleur pour l'état null
      iconWidget = Icon(Icons.remove, color: Colors.white, size: 14);
    } else if (value == true) {
      checkboxColor = SepteoColors.blue.shade900;
      iconWidget = Icon(Icons.check, color: Colors.white, size: 14);
    } else {
      checkboxColor = SepteoColors.grey.shade50;
      iconWidget = null;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: checkboxColor,
            borderRadius: BorderRadius.circular(SepteoSpacings.xxs),
            border: value == false || value == null
                ? Border.all(color: SepteoColors.grey.shade200, width: 1)
                : null,
          ),
          child: iconWidget,
        ),
      ),
    );
  }
}
