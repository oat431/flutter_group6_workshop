import 'package:flutter/material.dart';
import 'package:se494_rr_workshop/widget/rr_text.dart';
import 'package:url_launcher/url_launcher.dart';


class MyInfoBox extends StatefulWidget {
  String title;
  String subtitle;
  String detail;
  Color? color;

  MyInfoBox({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color
  }) : super(key: key);

  @override
  _MyInfoBoxState createState() => _MyInfoBoxState();
}

class _MyInfoBoxState extends State<MyInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5,left: 5,top: 5),
      padding: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(sometxt: widget.title, size: 18),
          const SizedBox(height: 20),
          MyText(sometxt: widget.subtitle, size: 16),
          const SizedBox(height: 20),
          MyText(sometxt: widget.detail, size:12)
        ],
      ),
    );
  }
}