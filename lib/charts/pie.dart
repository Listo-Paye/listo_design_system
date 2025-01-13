import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'indicator.dart';

class ChartPieItem {
  final double value;
  final Color? color;
  final String title;

  static List<Color> colors = [
    SepteoColors.blue.shade900,
    SepteoColors.orange.shade600,
    SepteoColors.green.shade800,
    SepteoColors.orange.shade800,
    SepteoColors.blue.shade800,
    SepteoColors.red.shade800,
    SepteoColors.blue.shade800,
    SepteoColors.orange.shade800,
    SepteoColors.grey.shade800,
    SepteoColors.green.shade600,
    SepteoColors.orange.shade600,
    SepteoColors.blue.shade600,
    SepteoColors.red.shade600,
    SepteoColors.grey.shade600,
    SepteoColors.blue.shade300,
    SepteoColors.orange.shade300,
    SepteoColors.orange.shade300,
    SepteoColors.red.shade300,
  ];

  ChartPieItem({
    required this.value,
    required this.title,
    this.color,
  });
}

class ChartPie extends StatefulWidget {
  final List<ChartPieItem> items;
  final bool isPercentage;

  const ChartPie({
    super.key,
    required this.items,
    this.isPercentage = true,
  });

  @override
  State<StatefulWidget> createState() => ChartPieState();
}

class ChartPieState extends State<ChartPie> {
  int touchedIndex = -1;
  List<ChartPieItem> _items = [];

  @override
  initState() {
    super.initState();
    setItems(widget.items);
  }

  void setItems(List<ChartPieItem> items) {
    List<ChartPieItem> result = [];
    var defaultColorIndex = 0;

    for (var item in items) {
      result.add(ChartPieItem(
        value: item.value,
        color: item.color ?? ChartPieItem.colors[defaultColorIndex],
        title: item.title,
      ));
      defaultColorIndex++;
      if (defaultColorIndex >= ChartPieItem.colors.length) {
        defaultColorIndex = 0;
      }
    }

    setState(() {
      _items = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      children: [
        SizedBox(),
        Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 150, // Définissez la largeur maximale souhaitée
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ..._items.toChartIndicator(),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(_items.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 12.0;
      final radius = isTouched ? 50.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return _items[i].toPieChartSectionData(
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
        unity: widget.isPercentage ? " %" : "",
      );
    });
  }
}

extension ChartMapper on List<ChartPieItem> {
  List<Widget> toChartIndicator() {
    List<Widget> result = [];
    for (int i = 0; i < length; i++) {
      result.add(ChartIndicator(
        color: this[i].color ?? ChartPieItem.colors[i],
        text: this[i].title,
        isSquare: false,
      ));
      if (i < length - 1) {
        result.add(SizedBox(
          height: 4,
        ));
      }
    }
    return result;
  }
}

extension ChartPieItemMapper on ChartPieItem {
  PieChartSectionData toPieChartSectionData({
    double? radius,
    TextStyle? titleStyle,
    String unity = " %",
  }) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: "${value.round()}$unity",
      radius: radius,
      titleStyle: titleStyle,
    );
  }
}
