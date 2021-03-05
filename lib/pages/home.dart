import 'package:flutter/material.dart';
import 'package:mcu_app/pages/video.dart';
import 'package:mcu_app/repository/data.dart';
import 'package:mcu_app/repository/mcu.dart';

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  MCU firstMovies;

  void setHome(int number) {
    setState(() {
      firstMovies = list[number];
    });
  }

  @override
  void initState() {
    super.initState();
    firstMovies = list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: NetworkImage(
              firstMovies.backgroundImage,
            ),
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
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Video(firstMovies.urlTrailer)),
                ),
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
                  "Linha temporal MCU",
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
                      itemBuilder: (context, int index) => GestureDetector(
                            onTap: () => setHome(index),
                            child: Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.transparent),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Image.network(
                                          list[index].mainImage,
                                          fit: BoxFit.fill,
                                          width: 120,
                                          height: 200,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 15,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Text(
                      "Veja mais",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
