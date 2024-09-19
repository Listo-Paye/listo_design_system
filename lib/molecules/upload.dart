import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../themes/colors.dart';
import '../themes/radius.dart';
import '../themes/spacing.dart';
import '../themes/text_style.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({super.key});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      text: "Ouvrir la modale",
      style: ButtonType.primary,
      width: 200,
      onPressed: () => _dialogBuilder(context),
    );
  }

  void selectFiles() {}

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacings.xs),
          ),
          contentPadding: const EdgeInsets.all(Spacings.lg),
          content: SizedBox(
            width: 508,
            height: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Importer une fiche Organisme Complémentaire",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.headingMediumSemibold.copyWith(
                    color: ListoMainColors.neutral.shade900,
                  ),
                ),
                const SizedBox(height: Spacings.sm),
                Expanded(
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    dashPattern: [4, 4],
                    child: Padding(
                      padding: const EdgeInsets.all(Spacings.xs),
                      child: InkWell(
                        hoverColor: ListoMainColors.primary.ultraLight,
                        highlightColor: ListoMainColors.primary.light,
                        splashColor: ListoMainColors.primary.light,
                        borderRadius: BorderRadius.circular(4),
                        onTap: selectFiles,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton.outlined(
                                onPressed: selectFiles,
                                icon: const Icon(
                                  Icons.file_download_outlined,
                                ),
                              ),
                              const SizedBox(width: Spacings.xs),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cliquez pour ajouter un fichier",
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyles.bodyMediumSemibold.copyWith(
                                      color: ListoMainColors.primary.base,
                                    ),
                                  ),
                                  const SizedBox(height: Radiuses.xs),
                                  Text(
                                      "ou le glisser/déposer ici (format .xml uniquement)",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.bodySmall.copyWith(
                                        color: ListoMainColors
                                            .primary.materialColor.shade900,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Button(
                    style: ButtonType.secondary,
                    text: 'Annuler',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: Spacings.xs),
                Expanded(
                  child: Button(
                    style: ButtonType.primary,
                    text: 'Importer la FOC',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
