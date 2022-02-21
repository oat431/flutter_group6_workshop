import 'package:flutter/material.dart';
import 'package:se494_rr_workshop/widget/rr_text.dart';
import 'package:url_launcher/url_launcher.dart';


class MyBox extends StatefulWidget {
  String imageUrl;
  String title;
  String subtitle;
  String detail;
  String url;

  MyBox({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.url
  }) : super(key: key);

  @override
  _MyBoxState createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  @override

  Future<void>? _launched;

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
              image: NetworkImage(
                  widget.imageUrl
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(sometxt: widget.title, size: 18),
          MyText(sometxt: widget.subtitle, size: 12),
          TextButton(
            onPressed: () => setState(() {
              _launched = _launchInWebViewOrVC(widget.url);
            }),
            child: MyText(sometxt: "read more",size: 10,),
          ),
        ],
      ),
    );
  }
}