import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MoveObjectAnimation extends StatefulWidget {
  static const routeName = '/move-animation';

  @override
  State<StatefulWidget> createState() {
    return new AnimationState();
  }
}

class AnimationState extends State<MoveObjectAnimation>
    with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));

    Tween tween = new Tween<double>(begin: 2.0, end: 200.0);

    _animation = tween.animate(_controller)
            ..addListener(() {
               setState(() {
                 print("1111");
      });

    });
   // _controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Animation'),
      ),
      body: new Container(
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Positioned(
                child: FlutterLogo(),
                height: 60.0,
                width: 100.0,
                left: _animation.value,
                top: 100.0)
          ],
        ),
      ),
    );
  }
}
