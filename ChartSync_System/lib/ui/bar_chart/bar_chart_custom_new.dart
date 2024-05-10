import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/ui/settings/theme_provider.dart';
import 'package:floatingbubble/ui/views/charts/chart_options.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:floatingbubble/widgets/multi_select_dialog_field/util/multi_select_item.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/chart_data.dart';

class BarChartCustomNew extends StatefulWidget {
  final int currentIndex;
  final GraphType graphType;
  final CustomChartData chartData;

  const BarChartCustomNew({
    Key key,
    this.currentIndex,
    this.graphType,
    this.chartData,
  }) : super(key: key);

  @override
  State<BarChartCustomNew> createState() => _BarChartCustomNewState();
}

class _BarChartCustomNewState extends State<BarChartCustomNew>
    with SingleTickerProviderStateMixin {
  ZoomPanBehavior _zoomingPanBehavior;
  final List<MultiSelectItem<SelectOption>> _items = [];
  bool showDialog = false;

  bool isZoomEnabled = false;

  List<ChartData> chartData;
  // List<List<ChartData>> chartData = baselineChartData;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    flutterTts.stop();
    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 450));

    _zoomingPanBehavior = ZoomPanBehavior(
      maximumZoomLevel: 0.1,
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
  }
  // List<MultiSelectItem<dynamic>>
  // List<MultiSelectItem<SelectOption>> _items

  FlutterTts flutterTts = FlutterTts();
  bool ttsStopped = true;

  @override
  Widget build(BuildContext context) {
    chartData = widget.chartData.comaprisonChartData;
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
                      dataSource: chartData,
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
                      dataSource: chartData,
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
                    .speak(widget.chartData.comaprisonChartDataSummary);
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
