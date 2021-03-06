import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mcu_app/pages/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash>
    with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);
  Tween<double> _opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController _controller;

  Timer _timer;
  startTimeout() {
    _timer = Timer(Duration(seconds: 5), _goToHome);
    return _timer;
  }

  _goToHome() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    startTimeout();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 15.0,
              ),
              child: TweenAnimationBuilder(
                tween: _scaleTween,
                duration: Duration(seconds: 2),
                builder: (context, scale, child) {
                  return Transform.scale(scale: scale, child: child);
                },
                child: Text(
                  "MCU Info",
                  style:
                      TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 15.0,
              ),
              child: TweenAnimationBuilder(
                tween: _opacityTween,
                duration: Duration(seconds: 2),
                builder: (context, opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
                child: Image(
                  image: AssetImage('images/logo.jpeg'),
                  width: 90,
                  height: 90),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
