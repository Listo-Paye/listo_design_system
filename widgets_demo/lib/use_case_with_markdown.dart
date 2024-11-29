import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_highlighter/themes/atom-one-light.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listo_design_system/listo_design_system.dart';
//ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart' as md;
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
              builders: {
                'code': CodeElementBuilder(),
              },
              styleSheet: MarkdownStyleSheet(
                p: SepteoTextStyles.bodySmallInter,
                strong: SepteoTextStyles.bodySmallInterBold,
                code: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Color(0xff282c34),
                ),
                codeblockDecoration: BoxDecoration(
                  color: Color(0xff282c34),
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

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }
    return HighlightView(
      // The original code to be highlighted
      element.textContent,

      // Specify language
      // It is recommended to give it a value for performance
      language: language,

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: MediaQueryData.fromView(
                      RendererBinding.instance.renderViews.first.flutterView)
                  .platformBrightness ==
              Brightness.light
          ? atomOneLightTheme
          : atomOneDarkTheme,

      // Specify padding
      padding: const EdgeInsets.all(8),

      // Specify text style
      textStyle: GoogleFonts.robotoMono(),
    );
  }
}
