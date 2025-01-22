import 'package:flutter/material.dart';
import 'package:listo_design_system/molecules/notifications/alert_banner.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookComponent alertBannerComponent(BuildContext context) {
  return WidgetbookComponent(
    name: "Notifications",
    useCases: [
      usercaseWithMarkdown(
        "Notification bandeau",
        (context) {
          return const AlertBannerPresenter();
        },
        "markdown/alert_banner.md",
      ),
    ],
  );
}

class AlertBannerPresenter extends StatefulWidget {
  const AlertBannerPresenter({super.key});

  @override
  State<AlertBannerPresenter> createState() => _AlertBannerPresenterState();
}

class _AlertBannerPresenterState extends State<AlertBannerPresenter> {
  final List<Widget> _activeBanners = [];

  void _showAlert({
    required AlertStatus status,
    required String title,
    String? text,
  }) {
    late final AlertBanner newBanner;

    newBanner = AlertBanner(
      title: title,
      text: text,
      status: status,
      duration: const Duration(seconds: 3),
      onClose: () {
        setState(() {
          _activeBanners.remove(newBanner);
        });
      },
    );

    setState(() {
      _activeBanners.add(newBanner);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ElevatedButton(
                onPressed: () => _showAlert(
                  status: AlertStatus.success,
                  title: "Succès",
                  text: "La demande a bien été prise en compte.",
                ),
                child: const Text("Show success alert (with title)"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _showAlert(
                  status: AlertStatus.info,
                  title: "Information",
                  text: "Cette opération prendra quelques instants.",
                ),
                child: const Text("Show info alert (with title)"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _showAlert(
                  status: AlertStatus.warning,
                  title: "Attention, vérifiez vos informations.",
                ),
                child: const Text("Show warning alert (no title)"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _showAlert(
                  status: AlertStatus.error,
                  title: "Une erreur est survenue.",
                ),
                child: const Text("Show error alert (no title)"),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: _activeBanners,
            ),
          ),
        ],
      ),
    );
  }
}
