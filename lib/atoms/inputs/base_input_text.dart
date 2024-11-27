import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listo_design_system/listo_design_system.dart';


class BaseInputText extends StatefulWidget {
  final String hintText;
  final List<TextInputFormatter> formatters;
  final InputDecoration decoration;
  final String? initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool enabled;
  final TextEditingController? controller;
  const BaseInputText({
    super.key,
    this.hintText = '',
    this.initialValue,
    this.onChanged,
    this.formatters = const [],
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.maxLines,
    this.enabled = true,
    this.controller,
  });

  @override
  State<BaseInputText> createState() => _BaseInputTextState();
}

class _BaseInputTextState extends State<BaseInputText> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ??
        TextEditingController(
          text: widget.initialValue,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SepteoColors.blue.shade50,
      child: TextField(
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        decoration: widget.decoration.copyWith(
          labelText: widget.hintText,
          alignLabelWithHint: widget.maxLines != null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: SepteoSpacings.md,
            vertical: SepteoSpacings.xs,
          ),
        ),
        textAlignVertical:
            (widget.maxLines != null) ? TextAlignVertical.top : null,
        inputFormatters: [...widget.formatters],
        controller: _controller,
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
      ),
    );
  }
}
