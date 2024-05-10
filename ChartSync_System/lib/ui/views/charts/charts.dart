import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/ui/bar_chart/bar_chart_custom_new.dart';
import 'package:floatingbubble/ui/bar_chart/bar_chart_new.dart';
import 'package:floatingbubble/ui/views/charts/chart_options.dart';
import 'package:floatingbubble/ui/line_chart/line_chart.dart';
import 'package:floatingbubble/ui/pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/chart_data.dart';

class Charts extends StatefulWidget {
  final List<SelectOption> selectedOptions;
  final GraphType graphType;
  final ViewType viewType;
  final int currentIndex;
  final Function toggleFilterDisplay;
  final bool isFilterEnabled;
  final CustomChartData chartData;

  const Charts({
    Key key,
    this.selectedOptions,
    this.graphType,
    this.viewType,
    this.currentIndex,
    this.toggleFilterDisplay,
    this.isFilterEnabled = false,
    this.chartData,
  }) : super(key: key);

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    StatefulWidget questionsComponent;

    switch (widget.graphType) {
      case GraphType.barChart:
        questionsComponent = widget.viewType == ViewType.custom
            ? BarChartCustomNew(
                currentIndex: widget.currentIndex,
                graphType: widget.graphType,
                chartData: widget.chartData,
              )
            : BarChartNew(
                currentIndex: widget.currentIndex,
                graphType: widget.graphType,
              );
        break;
      case GraphType.lineChart:
        questionsComponent = widget.viewType == ViewType.custom
            ? BarChartCustomNew(
                currentIndex: widget.currentIndex,
                graphType: widget.graphType,
                chartData: widget.chartData,
              )
            : BarChartNew(
                currentIndex: widget.currentIndex,
                graphType: widget.graphType,
              );
        break;
      case GraphType.pieChart:
        questionsComponent = PieChartUI(
          currentIndex: widget.currentIndex,
          selectedOptions: widget.selectedOptions,
          toggleFilterDisplay: widget.toggleFilterDisplay,
          isFilterEnabled: widget.isFilterEnabled,
        );
        break;
      default:
    }

    debugPrint("$questionsComponent");
    return questionsComponent;
  }
}
