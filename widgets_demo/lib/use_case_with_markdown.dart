import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook/widgetbook.dart';

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
              p: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              strong: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
              checkbox: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h1: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h2: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h3: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h4: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h5: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h6: GoogleFonts.lato(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              listBullet: GoogleFonts.lato(
                fontSize: 12,
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
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
    );
  }
}