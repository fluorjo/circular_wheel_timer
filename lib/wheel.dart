import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";

class Wheel extends StatefulWidget {
  const Wheel({Key? key}) : super(key: key);

  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  final double radius = 150;

  double _movement = 0;
  double _seconds = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _movement > 0 ? 'Clockwise' : 'Counter-Clockwise',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('$_movement'),
          Text(
            _seconds > 0 ? 'Clockwise' : 'Counter-Clockwise',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('$_seconds'),
          GestureDetector(
              onPanUpdate: _panHandler,
              child: Container(
                height: radius * 2,
                width: radius * 2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
              )),
        ],
      ),
    );
  }

  void _panHandler(DragUpdateDetails d) {
    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= radius;
    bool onLeftSide = d.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absoulte change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double vert = (onRightSide && panUp) || (onLeftSide && panDown)
        ? yChange * -1
        : yChange;

    double horz =
        (onTop && panLeft) || (onBottom && panRight) ? xChange * -1 : xChange;

    // Total computed change
    double rotationalChange = vert + horz;
    double rotationalChange2 = rotationalChange.roundToDouble();

    bool movingClockwise = rotationalChange > 0;
    bool movingCounterClockwise = rotationalChange < 0;

    var rrr = rotationalChange.round();

    setState(() {
      _movement = rotationalChange2;
      _seconds = _seconds + rrr;
    });

    // Now do something interesting with these computations!
  }
}
