import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

class MenuItemData {
  final String title;
  final String route;

  MenuItemData({required this.title, required this.route});
}

class MenuElement extends StatelessWidget {
  final String title;
  final String route;
  final bool selected;
  final void Function()? onSelect;
  const MenuElement({
    super.key,
    required this.title,
    required this.route,
    this.selected = false,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: selected ? SepteoColors.blue.shade200 : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: EdgeInsets.zero,
      child: Semantics(
        label: title,
        button: true,
        child: InkWell(
          hoverColor: SepteoColors.blue.shade50,
          highlightColor: SepteoColors.blue.shade200,
          splashColor: SepteoColors.blue.shade200,
          borderRadius: BorderRadius.circular(4),
          onTap: onSelect,
          child: Padding(
            padding: const EdgeInsets.all(SepteoSpacings.xs),
            child: Row(
              spacing: SepteoSpacings.md,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tooltip(
                        message: title,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: SepteoTextStyles.bodySmallInterBold
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SepteoSpacings.xs),
                  child: Icon(
                    Icons.chevron_right,
                    color: SepteoColors.orange.shade600,
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
