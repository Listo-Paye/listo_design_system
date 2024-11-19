import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:listo_design_system/listo_design_system.dart';

import 'indicator.dart';

class ChartPieItem {
  final double value;
  final Color? color;
  final String title;

  static List<Color> colors = [
    ListoMainColors.primary.base,
    ListoMainColors.secondary.base,
    ListoMainColors.success.darker,
    ListoMainColors.warning.darker,
    ListoMainColors.info.darker,
    ListoMainColors.error.darker,
    ListoMainColors.primary.darker,
    ListoMainColors.secondary.darker,
    ListoMainColors.neutral.shade800,
    ListoMainColors.success.dark,
    ListoMainColors.warning.dark,
    ListoMainColors.info.dark,
    ListoMainColors.error.dark,
    ListoMainColors.neutral.shade600,
    ListoMainColors.primary.medium,
    ListoMainColors.secondary.medium,
    ListoMainColors.warning.medium,
    ListoMainColors.error.medium,
  ];

  ChartPieItem({
    required this.value,
    required this.title,
    this.color,
  });
}

class ChartPie extends StatefulWidget {
  final List<ChartPieItem> items;

  const ChartPie({
    super.key,
    required this.items,
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
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ..._items.toChartIndicator(),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(_items.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return _items[i].toPieChartSectionData(
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: shadows,
          ));
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
        isSquare: true,
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
  }) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: "${value.round()} %",
      radius: radius,
      titleStyle: titleStyle,
    );
  }
}
