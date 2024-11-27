import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:listo_design_system/listo_design_system.dart';

WidgetbookUseCase usercaseWithMarkdown(
  String title,
  Widget? Function(BuildContext)? builder,
  String? mdAssetPath,
) {
  return WidgetbookUseCase(
    name: title,
    builder: (BuildContext context) {
      Widget? widget = builder == null ? null : builder(context);
      return CardWithMarkdown(
        title: title,
        widget: widget,
        mdAssetPath: mdAssetPath,
      );
    },
  );
}

class CardWithMarkdown extends StatefulWidget {
  final String title;
  final Widget? widget;
  final String? mdAssetPath;

  const CardWithMarkdown({
    super.key,
    required this.title,
    this.widget,
    this.mdAssetPath,
  });

  @override
  State<CardWithMarkdown> createState() => _CardWithMarkdownState();
}

class _CardWithMarkdownState extends State<CardWithMarkdown> {
  String mdData = "";

  @override
  void initState() {
    super.initState();

    if (widget.mdAssetPath != null) {
      rootBundle
          .loadString("${kDebugMode ? "" : "assets/"}${widget.mdAssetPath}")
          .then((value) => setState(() {
                mdData = value;
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            widget.widget ?? Container(),
            Markdown(
              shrinkWrap: true,
              data: mdData,
              styleSheet: MarkdownStyleSheet(
                p: SepteoTextStyles.bodySmallInter,
                strong: SepteoTextStyles.bodySmallInterBold,
                code: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.grey[900],
                ),
                codeblockDecoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                checkbox: SepteoTextStyles.bodySmallInterBold,
                h1: SepteoTextStyles.headingMediumInter,
                h2: SepteoTextStyles.bodyLargeInterBold,
                h3: SepteoTextStyles.bodyLargeInter,
                h4: SepteoTextStyles.bodyMediumInterBold,
                h5: SepteoTextStyles.bodyMediumInter,
                h6: SepteoTextStyles.bodySmallInterBold,
                listBullet: SepteoTextStyles.bodySmallInter,
              ),
              onTapLink: (text, url, title) {
                if (url != null) {
                  launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.platformDefault,
                  );
                }
              },
              selectable: true,
            ),
          ],
        ),
      ),
    );
  }
}
