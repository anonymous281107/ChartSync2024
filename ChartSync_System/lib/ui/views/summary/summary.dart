import 'package:floatingbubble/constants/constants.dart';
import 'package:floatingbubble/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../data/chart_data.dart';

class Summary extends StatefulWidget {
  final GraphType currentGraphType;
  final int currentIndex;

  const Summary({
    Key key,
    this.currentGraphType,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> with SingleTickerProviderStateMixin {
  String getCurrenGraphSummary() {
    switch (widget.currentGraphType) {
      case GraphType.barChart:
        return chartSummaryData[widget.currentIndex];
        break;
      case GraphType.lineChart:
        return chartSummaryData[widget.currentIndex];
        break;
      case GraphType.pieChart:
        return 'About 45% of the population resides in Region A followed by Region B, Region C, and Region D with 25%, 20%, and 10% of the population respectively.';
        break;
      default:
        return chartSummaryData[widget.currentIndex];
        break;
    }
  }

  AnimationController _animationController;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 450));
  }

  FlutterTts flutterTts = FlutterTts();
  bool ttsStopped = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                getCurrenGraphSummary(),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 50,
              ),
            ),
            PositionedDirectional(
              top: 5,
              start: 0,
              child: GestureDetector(
                onTap: () async {
                  if (ttsStopped) {
                    var result =
                        await flutterTts.speak(getCurrenGraphSummary());
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
        ),
      ),
    );
  }
}
