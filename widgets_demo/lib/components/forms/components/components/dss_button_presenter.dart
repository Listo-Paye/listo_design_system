import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

class DSSButtonPresenter extends StatelessWidget {
  const DSSButtonPresenter({super.key});

  static const List<Map<String, dynamic>> _buttonData = [
    {
      'label': 'Primary main',
      'styleType': DSSButtonStyle.primaryMain,
    },
    {
      'label': 'Primary second',
      'styleType': DSSButtonStyle.primarySecond,
    },
    {
      'label': 'Secondary main',
      'styleType': DSSButtonStyle.secondaryMain,
    },
    {
      'label': 'Secondary second',
      'styleType': DSSButtonStyle.secondarySecond,
    },
    {
      'label': 'Link main',
      'styleType': DSSButtonStyle.linkMain,
    },
    {
      'label': 'Link second',
      'styleType': DSSButtonStyle.linkSecond,
    },
  ];

  List<Widget> _buildButtonSet(DSSButtonSize size) {
    return _buttonData.expand((data) {
      return [
        DSSButton(
          label: data['label'] as String,
          styleType: data['styleType'] as DSSButtonStyle,
          size: size,
          onPressed: () {}, // Enabled
        ),
        DSSButton(
          label: data['label'] as String,
          styleType: data['styleType'] as DSSButtonStyle,
          size: size,
          disabled: true,
          onPressed: null, // Disabled
        ),
      ];
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large buttons
          Text(
            'Large Buttons',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _buildButtonSet(DSSButtonSize.large),
          ),
          const SizedBox(height: 24),

          // Medium buttons
          Text(
            'Medium Buttons',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _buildButtonSet(DSSButtonSize.medium),
          ),
          const SizedBox(height: 24),

          // Small buttons
          Text(
            'Small Buttons',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _buildButtonSet(DSSButtonSize.small),
          ),
        ],
      ),
    );
  }
}
