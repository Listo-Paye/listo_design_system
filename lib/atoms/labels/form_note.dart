import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class FormNoteAction {
  final String label;
  final void Function() onPressed;

  const FormNoteAction({
    required this.label,
    required this.onPressed,
  });
}

class Note {
  final String label;
  final String value;

  const Note({required this.label, required this.value});
}

class FormNote extends StatelessWidget {
  final String? title;
  final List<Note> notes;
  final FormNoteAction? action;

  const FormNote({
    super.key,
    required this.notes,
    this.title,
    this.action,
  });

  List<Widget> get _notes {
    return notes.map((note) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.label,
            style: SepteoTextStyles.captionInter.copyWith(
              color: SepteoColors.blue.shade900,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            note.value,
            style: SepteoTextStyles.bodySmallInter.copyWith(
              color: SepteoColors.grey.shade900,
            ),
          )
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0FF),
        borderRadius: BorderRadius.circular(0),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(SepteoSpacings.xs),
        child: LayoutBuilder(builder: (context, constraints) {
          return Wrap(
            direction: Axis.vertical,
            spacing: SepteoSpacings.xs,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: SepteoTextStyles.bodyMediumInterBold.copyWith(
                    color: SepteoColors.blue.shade900,
                  ),
                ),
              ..._notes,
              if (action != null)
                SizedBox(
                  width: constraints.maxWidth,
                  child: OutlinedButton(
                    onPressed: action!.onPressed,
                    style: ButtonStyles.secondary.copyWith(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      action!.label,
                      style: SepteoTextStyles.bodySmallInter.copyWith(
                        color: SepteoColors.blue.shade900,
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
