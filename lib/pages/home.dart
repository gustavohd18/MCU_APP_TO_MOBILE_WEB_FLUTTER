import 'package:flutter/material.dart';
import 'package:mcu_app/pages/information.dart';
import 'package:mcu_app/pages/video.dart';
import 'package:mcu_app/repository/data.dart';
import 'package:mcu_app/repository/mcu.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> with SingleTickerProviderStateMixin {
  MCU firstMovies;

  AnimationController _controller;

  void setHome(int number) {
    setState(() {
      firstMovies = list[number];
    });
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  void initState() {
    super.initState();
    firstMovies = list[0];
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            firstMovies.backgroundImage,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 100, left: 30),
                  child: Text(
                    firstMovies.name,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              (!kIsWeb)
                  ? IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Video(firstMovies.urlTrailer)),
                      ),
                      icon: Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      color: Colors.white,
                    )
                  : IconButton(
                      onPressed: () => _launchURL(firstMovies.urlTrailer),
                      icon: Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      color: Colors.white,
                    ),
              Padding(
                padding: EdgeInsets.only(top: 200, left: 10, bottom: 50),
                child: Text(
                  "Linha do Tempo MCU",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setHome(index),
                  child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0, 2.0),
                                  )
                                ]),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image.asset(
                                list[index].mainImage,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 200,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Checkbox(
                              value: (firstMovies.name == list[index].name),
                              checkColor: Colors.white,
                              onChanged: (value) => print("value"),
                            ),
                          )
                        ],
                      )),
                ),
              )),
              AnimatedBuilder(
                animation: _controller.view,
                builder: (context, child) {
                  return Transform.scale(
                      scale: _controller.value * 1.1, child: child);
                },
                child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Information(
                                firstMovies.backgroundImage,
                                firstMovies.name,
                                firstMovies.overview),
                          ),
                        ),
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
