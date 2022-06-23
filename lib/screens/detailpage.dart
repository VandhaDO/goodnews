import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  DetailScreen({
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail News'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin:
                EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mark Simonson'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Author : $author',
                        style: TextStyle(
                          fontFamily: 'Mark Simonson',
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$publishedAt',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Mark Simonson',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: urlToImage != null
                    ? Image.network(urlToImage)
                    : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text('$content',
                        style: TextStyle(
                          fontFamily: 'Mark Simonson',
                        )),
                    Divider(),
                    LaunchButton('$url', () async {
                      await openUrl('$url');
                    }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
class LaunchButton extends StatelessWidget {
  final String text;
  final void Function()? onTapp;

  LaunchButton(this.text, this.onTapp);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: RaisedButton(
          child: Text(text),color: Colors.amber[50], onPressed: onTapp),
    );
  }
}

Future<void> openUrl(String url,
    {bool forWebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}
