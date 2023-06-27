import 'dart:math';
import 'package:flutter/material.dart';

class BottomBox extends StatelessWidget {
  const BottomBox({
    Key? key,
    required this.size,
    required this.dayFormat,
    required this.dateFormat,
    this.isCurrentDay = false,
    required this.temperature,
    required this.humidity,
  }) : super(key: key);

  final Size size;
  final String dayFormat;
  final String dateFormat;
  final bool isCurrentDay;
  final int temperature;
  final int humidity;

  @override
  Widget build(BuildContext context) {
    Color color = isCurrentDay ? Colors.white : Colors.black;
    Color humidityColor = humidity < 60 ? Colors.green : Colors.red;
    String icon = temperature <= 0 ? '🌥️' : '☀️';

    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0),
      width: size.width * 0.20,
      height: size.height * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: isCurrentDay
            ? LinearGradient(
                colors: [
                  const Color.fromARGB(255, 217, 99, 230).withOpacity(0.9),
                  const Color.fromARGB(255, 154, 96, 229).withOpacity(0.9),
                  const Color.fromARGB(255, 142, 99, 236).withOpacity(0.9),
                ],
                stops: const [0.1, 0.5, 0.8],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: dayFormat,
                  style: TextStyle(color: color),
                ),
                TextSpan(
                  text: '\n$dateFormat',
                  style: TextStyle(
                      color: isCurrentDay ? Colors.white : Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            icon,
            style: const TextStyle(fontSize: 30.0),
          ),
          Text(
            isCurrentDay
                ? "$temperature"
                : "${temperature + Random().nextInt(5) - 2}",
            style: TextStyle(fontSize: 30.0, color: color),
          ),
          Container(
            width: 35.0,
            height: 25.0,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: humidityColor,
            ),
            child: Center(
              child: Text(
                isCurrentDay
                    ? "$humidity"
                    : "${humidity + Random().nextInt(10) - 5}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
