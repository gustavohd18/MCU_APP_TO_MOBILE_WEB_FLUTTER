import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemNew extends StatelessWidget {
  final String title, data, time, link;

  ItemNew({@required this.title, this.data, this.time, this.link});

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _launchURL(link),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 280, right: 5),
              child: Text(
                data,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black26),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 280, right: 5),
              child: Text(
                time,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black26),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 280, right: 5),
              child: Text(
                "Fonte: Tecmundo",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black26),
              ),
            ),
            Divider(
              height: 2,
              color: Colors.black26,
            )
          ],
        ));
  }
}
