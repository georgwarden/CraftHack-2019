import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class DiceScreen extends StatefulWidget {
  @override
  State<DiceScreen> createState() => _DiceState();
}

class _DiceState extends State<DiceScreen> with SingleTickerProviderStateMixin {
  Matrix4 _transformation = Matrix4.identity();
  double _rotation = 0;
  double _delta = 0.3;
  AnimationController _controller;
  int _currentSide = 1;
  Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0,
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        origin: Offset(32, 32),
        transform: _transformation,
        child: GestureDetector(
          onTap: _controller.isCompleted || _controller.isDismissed
              ? _onTap
              : null,
          child: Image.asset("assets/inverted-dice-" + _currentSide.toString() + ".png", width: 64, height: 64,),
        ),
      ),
    );
  }

  void _onTap() {
    _controller.addListener(_onRotate);
    _controller.addStatusListener(_onChangeStatus);
    setState(() {
      _controller.animateTo(1.0, duration: Duration(seconds: 3));
    });
  }

  void _onChangeStatus(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
      case AnimationStatus.completed:
        _controller.removeListener(_onRotate);
        _controller.removeStatusListener(_onChangeStatus);
        _controller.reset();
        _delta = 0.3;
        break;
      case AnimationStatus.forward:
        break;
      case AnimationStatus.reverse:
        break;
    }
  }

  void _onRotate() {
    setState(() {
      _rotation += _delta;
      _delta -= 0.01;
      if (_delta <= -0.2) {
        _currentSide = _random.nextInt(5) + 1;
      }
      _transformation.setRotationZ(_rotation);
    });
  }
}
