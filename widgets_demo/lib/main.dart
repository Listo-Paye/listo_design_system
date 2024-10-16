import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:widgetbook/widgetbook.dart';

import 'components/widgetbook.dart';
import 'use_case_with_markdown.dart';

void main() {
  usePathUrlStrategy();
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> params =
        Map.fromEntries(Uri.base.queryParameters.entries);
    var path = params["path"] ?? 'accueil%2Freadme';
    return Widgetbook.material(
      initialRoute: "/?path=$path",
      addons: [
        DeviceFrameAddon(devices: [
          ...Devices.android.all,
          ...Devices.ios.all,
          Devices.linux.laptop,
          Devices.windows.wideMonitor,
        ]),
      ],
      directories: [
        WidgetbookComponent(name: "Accueil", useCases: [
          usercaseWithMarkdown(
            "README",
            null,
            "markdown/introduction.md",
          ),
        ]),
        ...componentCategories(context),
      ],
    );
  }
}
