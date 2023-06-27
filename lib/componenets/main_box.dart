import 'package:flutter/material.dart';
import 'package:flutter_application_1/constraints/constant.dart';

class MainBox extends StatelessWidget {
  const MainBox({
    super.key,
    required this.size,
    required this.temperature,
    required this.feelLike,
    required this.description,
    required this.imgNumber,
  });

  final Size size;
  final int temperature;
  final int feelLike;
  final int imgNumber;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 217, 99, 230),
                  Color.fromARGB(255, 154, 96, 229),
                  Color.fromARGB(255, 142, 99, 236),
                ],
                stops: [0.1, 0.5, 0.8],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 154, 96, 229),
                  offset: Offset(0, 10),
                  blurRadius: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: const Offset(0, -20),
                        child: SizedBox(
                          width: 125.0,
                          height: 100.0,
                          child: Image.asset(
                            'assets/$imgNumber.png',
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '$temperature°\n',
                            style: const TextStyle(fontSize: 60.0),
                          ),
                          TextSpan(
                              text: 'Feels like $feelLike°',
                              style: const TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                            fontSize: 17.0, color: Colors.white),
                      ),
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: Image.asset(
                          'assets/snowflake.png',
                          opacity: const AlwaysStoppedAnimation(.3),
                          fit: BoxFit.fill,
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
