import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class TypographyDocumentation extends StatelessWidget {
  const TypographyDocumentation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Typography', style: SepteoTextStyles.headingLargeInter),
            const SizedBox(height: 32),
            Text('Fonts style', style: SepteoTextStyles.bodyMediumInterBold),
            const SizedBox(height: 16),
            Text('Deux font peuvent être utilisé :',
                style: SepteoTextStyles.bodyMediumInter),
            const SizedBox(height: 16),
            Text('La Poppins', style: SepteoTextStyles.bodyMediumInterBold),
            Text(
              "C'est la typographie officielle de Septeo. Elle est essentiellement utilisé pour la communication et le marketing. Elle peut être utilisé pour du titrage dans les applications mais jamais en texte courant ou pour du contenu informatif.",
              style: SepteoTextStyles.bodyMediumInter,
            ),
            const SizedBox(height: 16),
            Text('La Inter', style: SepteoTextStyles.bodyMediumInterBold),
            Text(
              "C'est la typographie sélectionné par Septeo pour l'ensemble des applications. Adapté au web, sa lisibilité est optimisé pour les écrans, même dans les petites tailles.",
              style: SepteoTextStyles.bodyMediumInter,
            ),
            const SizedBox(height: 32),
            Text('Font size', style: SepteoTextStyles.bodyMediumInterBold),
            Text('Taille de la font et usages globaux',
                style: SepteoTextStyles.bodyMediumInter),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Valeur')),
                  DataColumn(label: Text('Line Height')),
                  DataColumn(label: Text('Usage desktop')),
                  DataColumn(label: Text('Usage mobile')),
                  DataColumn(label: Text('Token')),
                ],
                rows: [
                  _buildRow('010', '10px', '14px', 'Legal Content',
                      'Legal content', 'size.font.010'),
                  _buildRow('020', '12px', '18px', 'Caption', 'Caption',
                      'size.font.020'),
                  _buildRow('030', '14px', '20px', 'Body Small', 'Body Small',
                      'size.font.030'),
                  _buildRow('040', '16px', '24px', 'Body Medium', 'Body Medium',
                      'size.font.040'),
                  _buildRow('050', '18px', '28px', 'Body Large', 'Body Large',
                      'size.font.050'),
                  _buildRow('060', '20px', '28px', '-', 'Heading Small',
                      'size.font.060'),
                  _buildRow('070', '22px', '32px', 'Heading Small',
                      'Heading medium', 'size.font.070'),
                  _buildRow('080', '24px', '36px', 'Heading medium',
                      'Heading Large', 'size.font.080'),
                  _buildRow('090', '28px', '40px', 'Heading Large', '-',
                      'size.font.090'),
                  _buildRow(
                      '100', '32px', '56px', 'Hero', '-', 'size.font.100'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Examples', style: SepteoTextStyles.bodyMediumInterBold),
            const SizedBox(height: 16),
            Text('Inter Font:', style: SepteoTextStyles.bodyMediumInterBold),
            _buildExampleText(SepteoTextStyles.heroInter),
            _buildExampleText(SepteoTextStyles.headingLargeInter),
            _buildExampleText(SepteoTextStyles.headingMediumInter),
            _buildExampleText(SepteoTextStyles.headingSmallInter),
            _buildExampleText(SepteoTextStyles.bodyLargeInter),
            _buildExampleText(SepteoTextStyles.bodyMediumInter),
            _buildExampleText(SepteoTextStyles.bodySmallInter),
            _buildExampleText(SepteoTextStyles.captionInter),
            _buildExampleText(SepteoTextStyles.legalContentInter),
            const SizedBox(height: 24),
            _buildExampleText(SepteoTextStyles.heroInterBold),
            _buildExampleText(SepteoTextStyles.headingLargeInterBold),
            _buildExampleText(SepteoTextStyles.headingMediumInterBold),
            _buildExampleText(SepteoTextStyles.headingSmallInterBold),
            _buildExampleText(SepteoTextStyles.bodyLargeInterBold),
            _buildExampleText(SepteoTextStyles.bodyMediumInterBold),
            _buildExampleText(SepteoTextStyles.bodySmallInterBold),
            _buildExampleText(SepteoTextStyles.captionInterBold),
            _buildExampleText(SepteoTextStyles.legalContentInterBold),
            const SizedBox(height: 24),
            Text('Popins Font:', style: SepteoTextStyles.bodyMediumPopinsBold),
            _buildExampleText(SepteoTextStyles.heroPopins),
            _buildExampleText(SepteoTextStyles.headingLargePopins),
            _buildExampleText(SepteoTextStyles.headingMediumPopins),
            _buildExampleText(SepteoTextStyles.headingSmallPopins),
            _buildExampleText(SepteoTextStyles.bodyLargePopins),
            _buildExampleText(SepteoTextStyles.bodyMediumPopins),
            _buildExampleText(SepteoTextStyles.bodySmallPopins),
            _buildExampleText(SepteoTextStyles.captionPopins),
            _buildExampleText(SepteoTextStyles.legalContentPopins),
            const SizedBox(height: 24),
            _buildExampleText(SepteoTextStyles.heroPopinsBold),
            _buildExampleText(SepteoTextStyles.headingLargePopinsBold),
            _buildExampleText(SepteoTextStyles.headingMediumPopinsBold),
            _buildExampleText(SepteoTextStyles.headingSmallPopinsBold),
            _buildExampleText(SepteoTextStyles.bodyLargePopinsBold),
            _buildExampleText(SepteoTextStyles.bodyMediumPopinsBold),
            _buildExampleText(SepteoTextStyles.bodySmallPopinsBold),
            _buildExampleText(SepteoTextStyles.captionPopinsBold),
            _buildExampleText(SepteoTextStyles.legalContentPopinsBold),
          ],
        ),
      ),
    );
  }

  DataRow _buildRow(String id, String value, String lineHeight,
      String usageDesktop, String usageMobile, String token) {
    return DataRow(
      cells: [
        DataCell(Text(id)),
        DataCell(Text(value)),
        DataCell(Text(lineHeight)),
        DataCell(Text(usageDesktop)),
        DataCell(Text(usageMobile)),
        DataCell(Text(token)),
      ],
    );
  }

  Widget _buildExampleText(TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "A wizard's job is to vex chumps quickly in fog.",
        style: style,
      ),
    );
  }
}