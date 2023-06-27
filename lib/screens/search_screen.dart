import 'package:flutter/material.dart';
import 'package:flutter_application_1/constraints/constant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String cityName = "";
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: BackIcon(),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 217, 99, 230).withOpacity(0.7),
                        const Color.fromARGB(255, 154, 96, 229).withOpacity(0.7),
                        const Color.fromARGB(255, 142, 99, 236).withOpacity(0.7),
                      ],
                      stops: const [0.1, 0.5, 0.8],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 160, 107, 229).withOpacity(0.5),
                        offset: const Offset(0, 10),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: const Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 45.0,
        height: 45.0,
        decoration: kBoxDecoration.copyWith(
          shape: BoxShape.circle,
        ),
        child: const ClipOval(
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
