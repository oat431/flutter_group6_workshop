import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:se494_rr_workshop/model/covid_articles.dart';
import 'package:se494_rr_workshop/widget/rr_card.dart';

import 'package:se494_rr_workshop/state/provider.dart';

class RustyRiverSwiper extends StatefulWidget {
  List<CovidArticles> recommend = [];

  RustyRiverSwiper({Key? key,required this.recommend}) : super(key: key);


  @override
  _RustyRiverSwiperState createState() => _RustyRiverSwiperState();
}

class _RustyRiverSwiperState extends State<RustyRiverSwiper> {
  // List<Map<String, String>> news = [
  //   {
  //     "imageUrl":
  //         "https://ddc.moph.go.th/viralpneumonia/eng/img/infographic/instruction.jpg",
  //     "title": "Instruction for observation At residence",
  //     "subtitle": "\n\nMonitor your symptom",
  //     "detail": "avoid",
  //     "url":
  //         "https://ddc.moph.go.th/viralpneumonia/eng/img/infographic/instruction.jpg"
  //   },
  //   {
  //     "imageUrl":
  //         "https://www.gavi.org/sites/default/files/covid/shutterstock_1896381730-hf-grey.jpg",
  //     "title": "COVID-19 vaccines: everything you need to know",
  //     "subtitle":
  //         "\n\nNow that COVID-19 vaccines have reached billions of people worldwide, the evidence is overwhelming that no matter which one you take, the vaccines offer life-saving protection against a disease that has killed millions. The pandemic is far from over, and they are our best bet of staying safe.",
  //     "detail": "Covid 19",
  //     "url": "https://www.gavi.org/covid19-vaccines"
  //   },
  //   {
  //     "imageUrl":
  //     "https://ik.imagekit.io/tvlk/blog/2021/07/Infographic_Rapid-Antigen_EN-1024x615-1.jpg?tr=dpr-1.25,w-675",
  //     "title": "Covid-19 Rapid Antigen Test Procedure",
  //     "subtitle": "\n\n How to use",
  //     "detail": "avoid",
  //     "url":
  //     "https://www.traveloka.com/en-th/explore/health/rapid-antigen-test-vs-rapid-antibody-test/88355"
  //   },
  //   {
  //     "imageUrl":
  //     "https://www.iaea.org/sites/default/files/rt-pcr_infographic_02.png",
  //     "title": "COVID-19 Real-time RT-PCR Explained",
  //     "subtitle":
  //     "\n\nSince the emergence of COVID-19 in late 2019, the gold standard in testing for the disease has been a nuclear-derived technique: real-time reverse transcription–polymerase chain reaction, or real-time RT–PCR. Fast and accurate, real-time RT–PCR has been critical in detecting, tracking and studying COVID-19. But what is it and how does it work?",
  //     "detail": "Covid 19",
  //     "url": "https://www.iaea.org/bulletin/covid-19-real-time-rt-pcr-explained"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        final item = widget.recommend[index];
        return MyBox(
            imageUrl: item.urlToImage,
            title: item.title,
            subtitle: item.description,
            detail: item.content,
            url: item.url);
      },
      itemCount: widget.recommend.length,
      autoplay: true,
    );
  }
}
