import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:off_top_mobile/components/subnavbar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:off_top_mobile/components/reports/scores.dart';

class ReportsGraph extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<ReportsGraph> {
  List<charts.Series<Scores, int>> _seriesLineData;
  void _generateData() {
    var linesscoresdata1 = [
      new Scores(0, 45),
      new Scores(1, 56),
      new Scores(2, 55),
      new Scores(3, 60),
      new Scores(4, 61),
      new Scores(5, 70),
    ];

    var linesscoresdata2 = [
      new Scores(0, 35),
      new Scores(1, 46),
      new Scores(2, 45),
      new Scores(3, 50),
      new Scores(4, 51),
      new Scores(5, 60),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Heart beat',
        data: linesscoresdata1,
        domainFn: (Scores scores, _) => scores.scoreval,
        measureFn: (Scores scores, _) => scores.beatsval,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Focus score',
        data: linesscoresdata2,
        domainFn: (Scores scores, _) => scores.scoreval,
        measureFn: (Scores scores, _) => scores.beatsval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<Scores, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Focus Score Graph',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: charts.LineChart(_seriesLineData,
                  defaultRenderer: new charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.SeriesLegend(
                      position: charts.BehaviorPosition.bottom,
                      outsideJustification:
                          charts.OutsideJustification.middleDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 1,
                      cellPadding: new EdgeInsets.only(right: 100.0,bottom: 5.0, top: 10.0),
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.Color(r: 127, g: 63, b: 191),
                          fontFamily: 'sans-serif',
                          fontSize: 12),
                    ),
                    new charts.ChartTitle('Time(min)',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                    new charts.ChartTitle('Score',
                        behaviorPosition: charts.BehaviorPosition.start,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}