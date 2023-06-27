import 'package:flutter/material.dart';
import 'package:flutter_application_1/componenets/white_box_content.dart';
import 'package:flutter_application_1/constraints/constant.dart';

class WhiteBox extends StatelessWidget {
  const WhiteBox({
    Key? key,
    required this.size,
    required this.feelLike,
    required this.wind,
    required this.maxTemp,
    required this.humidity,
  }) : super(key: key);

  final Size size;
  final int feelLike;
  final int wind;
  final int humidity;
  final int maxTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      width: double.infinity,
      height: size.height * 0.21,
      decoration: kBoxDecoration.copyWith(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Text(
              "🌧️ Air Quality",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: WhiteBoxContent(
                          icon: '🌥️',
                          text: 'Reel feel',
                          val: '$feelLike°',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: WhiteBoxContent(
                          icon: '💨',
                          text: 'Wind',
                          val: '$wind',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WhiteBoxContent(
                          icon: '☁️',
                          text: 'Humidity',
                          val: '$humidity',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: WhiteBoxContent(
                          icon: '☀️',
                          text: 'Temp Max',
                          val: '$maxTemp°',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
