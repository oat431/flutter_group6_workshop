import 'package:flutter/material.dart';

class RustyRiverBottomBar extends StatelessWidget{
  const RustyRiverBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            child: IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () => Navigator.of(context).pushNamed("/"),
            ),
          ),
          const SizedBox(width: 50,),
          SizedBox(
            width: 40,
            child: IconButton(
              tooltip: 'News',
              icon: const Icon(Icons.analytics_outlined),
              onPressed: () => Navigator.of(context).pushNamed("/covid-status"),
            ),
          ),
          const SizedBox(width: 50,),
          SizedBox(
            width: 40,
            child: IconButton(
              tooltip: 'News',
              icon: const Icon(Icons.web_asset_sharp),
              onPressed: () => Navigator.of(context).pushNamed("/covid-news"),
            ),
          ),
          const SizedBox(width: 50,),
          SizedBox(
            width: 40,
            child: IconButton(
              tooltip: 'News',
              icon: const Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).pushNamed("/about"),
            ),
          ),
        ],
      ),
    );
  }
}