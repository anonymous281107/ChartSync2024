import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/ui/settings/theme_provider.dart';
import 'package:floatingbubble/ui/views/charts/chart_options.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/multi_select_dialog_field.dart';
import 'package:flutter/material.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/util/multi_select_item.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/chart_data.dart';

class BarChartNew extends StatefulWidget {
  final int currentIndex;
  final GraphType graphType;

  const BarChartNew({
    Key key,
    this.currentIndex,
    this.graphType,
  }) : super(key: key);

  @override
  State<BarChartNew> createState() => _BarChartNewState();
}

class _BarChartNewState extends State<BarChartNew>
    with SingleTickerProviderStateMixin {
  ZoomPanBehavior _zoomingPanBehavior;
  final List<MultiSelectItem<SelectOption>> _items = [];
  bool showDialog = false;

  List<ChartData> filteredData = [];
  bool isFiltered = false;

  bool isZoomEnabled = false;

  List<List<ChartData>> chartData = baselineChartData;

  FlutterTts flutterTts = FlutterTts();
  bool ttsStopped = true;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    flutterTts.stop();
    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 450));

    for (var i = 0; i < chartData[widget.currentIndex].length; i++) {
      _items.add(
        MultiSelectItem<SelectOption>(
            SelectOption(id: i, name: chartData[widget.currentIndex][i].xLabel),
            chartData[widget.currentIndex][i].xLabel),
      );
    }
    _zoomingPanBehavior = ZoomPanBehavior(
      maximumZoomLevel: 0.1,
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
  }
  // List<MultiSelectItem<dynamic>>
  // List<MultiSelectItem<SelectOption>> _items

  List<ChartData> showChartData(bool isFiltered) {
    debugPrint("isFiltered :- $isFiltered");
    if (isFiltered) {
      debugPrint("$filteredData");
      return filteredData;
    } else {
      return chartData[widget.currentIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SfCartesianChart(
            backgroundColor: themeProvider.contrastColor,
            zoomPanBehavior: _zoomingPanBehavior,
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelRotation: themeProvider.axisLabelFontSize > 14.0 ||
                      widget.currentIndex == 2 ||
                      widget.currentIndex == 3
                  ? 300
                  : 0,
              labelStyle: TextStyle(
                fontSize: themeProvider.axisLabelFontSize,
              ),
            ),
            primaryYAxis: NumericAxis(
              decimalPlaces: 0,
              labelStyle: TextStyle(
                fontSize: themeProvider.axisLabelFontSize,
              ),
            ),
            // Chart title
            // title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            // tooltipBehavior: TooltipBehavior(
            //   enable: true,
            //   textAlignment: ChartAlignment.center,
            //   color: themeProvider.tooltipContrastColor,
            //   format: 'point.y\npoint.x',
            //   textStyle: TextStyle(
            //     fontSize: themeProvider.tooltipSize,
            //     color: themeProvider.tooltipTitleColor,
            //   ),
            // ),
            onZoomStart: (zoomingArgs) {
              debugPrint("Zooming Args :- ${zoomingArgs.currentZoomFactor}");
              if (zoomingArgs.currentZoomFactor > 0) {
                setState(() => isZoomEnabled = true);
              } else {
                setState(() => isZoomEnabled = false);
              }
            },
            series: widget.graphType == GraphType.barChart
                ? <ColumnSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: showChartData(isFiltered),
                      xValueMapper: (ChartData sales, _) => sales.xLabel,
                      yValueMapper: (ChartData sales, _) => sales.yLabel,
                      // Enable data label
                      color: themeProvider.chartBarsColor,
                      isVisibleInLegend: false,
                      name: "",
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: false),
                    )
                  ]
                : <LineSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: showChartData(isFiltered),
                      xValueMapper: (ChartData sales, _) => sales.xLabel,
                      yValueMapper: (ChartData sales, _) => sales.yLabel,
                      // Enable data label
                      color: themeProvider.chartBarsColor,
                      isVisibleInLegend: false,
                      name: "",
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: false),
                    )
                  ],
          ),
        ),
        MultiSelectDialogField(
          // key: GlobalKey<FormFieldState>(),
          isOpen: showDialog,
          // chipDisplay: MultiSelectChipDisplay.none(),
          isChipsDisplayEnabled: true,
          dialogHeight: 250,
          items: _items,
          itemsTextStyle: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          selectedItemsTextStyle: const TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          title: const Text("Select Option"),
          selectedColor: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          buttonText: Text(
            "Filter Graph",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
          onConfirm: (results) async {
            // setState(() {});
            _zoomingPanBehavior.reset();
            debugPrint("Results :- $results");
            if (results.isEmpty) {
              filteredData.clear();
              setState(() => isFiltered = false);
            } else {
              filteredData.clear();
              for (var resultItem in results) {
                var monthItem = chartData[widget.currentIndex].firstWhere(
                    (monthItem) => monthItem.xLabel == resultItem.name);
                filteredData.add(monthItem);
              }

              setState(() => isFiltered = true);
            }
          },
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () => setState(() => showDialog = !showDialog),
        ),
        if (isZoomEnabled)
          PositionedDirectional(
            bottom: 10,
            end: 10,
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _zoomingPanBehavior.panToDirection('top');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SpaceH8(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _zoomingPanBehavior.panToDirection('bottom');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SpaceH8(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() => isZoomEnabled = false);
                    _zoomingPanBehavior.reset();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.PADDING_6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.RADIUS_80),
                      color: AppColors.linkedInBlueColor,
                    ),
                    child: const Icon(
                      Icons.zoom_out,
                      size: Sizes.ICON_SIZE_40,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        PositionedDirectional(
          top: 5,
          start: 0,
          child: GestureDetector(
            onTap: () async {
              await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});

              if (ttsStopped) {
                var result = await flutterTts
                    .speak(baselineChartSummaryData[widget.currentIndex]);
                if (result == 1) {
                  setState(() => ttsStopped = false);
                  _animationController.forward();
                }
              } else {
                var result = await flutterTts.stop();
                if (result == 1) {
                  setState(() => ttsStopped = true);
                  _animationController.reverse();
                }
              }
            },
            child: Container(
              width: Sizes.WIDTH_130,
              color: Colors.blue,
              alignment: Alignment.center,
              child: AnimatedIcon(
                progress: _animationController,
                icon: AnimatedIcons.play_pause,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
