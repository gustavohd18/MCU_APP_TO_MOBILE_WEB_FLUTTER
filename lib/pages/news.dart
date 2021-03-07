import 'package:flutter/material.dart';
import 'package:mcu_app/model/news.dart';
import 'package:mcu_app/widgets/itemNew.dart';

class News extends StatelessWidget {
  News(this._future);

  final Future<List<NewsMarvel>> _future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder<List<NewsMarvel>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.hasData && snapshot.data.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(6.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int position) {
                      final item = snapshot.data[position];
                      return ItemNew(
                        title: item.title,
                        data: item.data,
                        time: item.time,
                        link: item.link,
                      );
                    })
                : Center(
                    child: Text(
                      "Nenhuma noticia encontrada.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  );
          },
        ));
  }
}
