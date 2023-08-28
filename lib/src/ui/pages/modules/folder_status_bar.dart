import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:the_remember/src/domain_layer/providers/main/folders/folder_progress_bar.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../ui_states/modules/folder_status_bar.dart';

class FolderStatusBarWidget extends StatelessWidget {
  final FolderOrModule currEntity;

  const FolderStatusBarWidget(this.currEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0x00ffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: Color(0xffffff), width: 0),
        ),
        child: Align(

            alignment: Alignment(1, 0.0),
            child: Container(
              margin: EdgeInsets.all(10),
              // margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0x1fffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
                border: Border.all(color: Color(0xffffff), width: 0),
              ),
              child: FolderStatusBarAddConsumer(currEntity),
            )),
      ),
    );
  }
}

class CircleFolderStatusBarWidget extends StatelessWidget {
  final FolderStats statusInfo;

  CircleFolderStatusBarWidget(this.statusInfo);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        pointers: <GaugePointer>[
          RangePointer(
            value: statusInfo.watch.toDouble(),
            cornerStyle: CornerStyle.bothCurve,
            width: 0.1,
            sizeUnit: GaugeSizeUnit.factor,
            color: Color(0xff1caafa),
            pointerOffset: 0.0,
          ),
          RangePointer(
            value: statusInfo.choice.toDouble(),
            cornerStyle: CornerStyle.bothCurve,
            width: 0.1,
            sizeUnit: GaugeSizeUnit.factor,
            color: Color(0xffffdd4f),
            pointerOffset: 0.1,
          ),
          RangePointer(
            value: statusInfo.write.toDouble(),
            cornerStyle: CornerStyle.bothCurve,
            width: 0.1,
            sizeUnit: GaugeSizeUnit.factor,
            color: Color(0xff6eff42),
            pointerOffset: 0.2,
          ),

        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Text(
                " " +
                    statusInfo.write.toStringAsFixed(0) +
                    ' /\n ' +
                    statusInfo.choice.toStringAsFixed(0) +
                    ' /\n ' +
                    statusInfo.all.toStringAsFixed(0) +
                    "  ",
                style: TextStyle(fontSize: 9),
              )),
        ],
        minimum: 0,
        maximum: statusInfo.all.toDouble(),
        showLabels: false,
        showTicks: false,
        axisLineStyle: AxisLineStyle(
          thickness: 0.1,
          cornerStyle: CornerStyle.bothCurve,
          color: Color(0x8B8F8F8F),
          thicknessUnit: GaugeSizeUnit.factor,
        ),
      ),
    ]);
  }
}
