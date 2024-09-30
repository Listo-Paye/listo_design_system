import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'form_base_labels.dart';

class FormKeyValueList extends StatelessWidget {
  final String hint;
  final Map<String, String> values;

  const FormKeyValueList({
    super.key,
    required this.hint,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    var border = BorderSide(color: ListoMainColors.primary.light, width: .4);
    return FormBaseLabels(
      hint: hint,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: ListoMainColors.primary.light,
                  border: Border(
                    top: border,
                    bottom: border,
                    left: border,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    values.keys.elementAt(index),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: border,
                    bottom: border,
                    right: border,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    values.values.elementAt(index),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, _) => const SizedBox(height: 2),
        itemCount: values.length,
      ),
    );
  }
}
