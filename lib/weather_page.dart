import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yahoo_weather_app/home_page.dart';
import 'package:yahoo_weather_app/sigma.dart';
import 'package:yahoo_weather_app/weather_background.dart';

final double blur = 8;

class WeatherPage extends StatefulWidget {
  final Sigma _sigma = new Sigma();

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  ScrollController _controller;

  _onScrolled() {
    widget._sigma.setSigma(_controller.offset / size.height * blur);
  }

  @override
  void initState() {
    _controller = ScrollController()..addListener(_onScrolled);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ChangeNotifierProvider.value(
            value: widget._sigma, child: new WeatherBackground()),
        ListView(
          controller: _controller,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black26,
              width: size.width,
              height: size.height,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "21°C",
                    textScaleFactor: 8,
                    style: TextStyle(
                        fontWeight: FontWeight.w100, color: Colors.white),
                  )),
            ),
            Container(
              color: Colors.black26,
              width: size.width,
              height: size.height,
            ),
          ],
        )
      ],
    );
  }
}
