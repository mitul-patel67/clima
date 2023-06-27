import 'package:flutter/material.dart';
import 'package:flutter_application_1/componenets/bottom_box.dart';
import 'package:flutter_application_1/componenets/header_box.dart';
import 'package:flutter_application_1/componenets/main_box.dart';
import 'package:flutter_application_1/componenets/white_box.dart';
import 'package:flutter_application_1/constraints/constant.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.locationWeather});

  final dynamic locationWeather;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int temperature;
  late int feelLike;
  late int wind;
  late int maxTemp;
  late int humidity;
  late int id;
  late String cityName;
  late String description;
  late int imgNumber;

  @override
  void initState() {
    super.initState();
    dynamic weatherData = widget.locationWeather;
    update(weatherData);
  }

  void update(dynamic weatherData) {
    if (weatherData == null) {
      cityName = 'ERROR';
      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    double feel = weatherData['main']['feels_like'];
    feelLike = feel.toInt();
    double windDouble = weatherData['wind']['speed'];
    wind = windDouble.toInt();
    id = weatherData['weather'][0]['id'];
    double maxTempDouble = weatherData['main']['temp_max'];
    maxTemp = maxTempDouble.toInt();
    humidity = weatherData['main']['humidity'];
    cityName = weatherData['name'];
    description = weatherData['weather'][0]['description'];

    String num = id.toString();
    if (num[0] == '2') {
      imgNumber = 11;
    } else if (num[0] == '3') {
      imgNumber = 9;
    } else if (num[0] == '5') {
      imgNumber = 10;
    } else if (num[0] == '6') {
      imgNumber = 50;
    } else if (num[0] == '7') {
      imgNumber = 13;
    } else if (num[0] == '8') {
      imgNumber = 2;
    } else if (num == '800') {
      imgNumber = 1;
    } else {
      imgNumber = 4;
    }

    // print(id);

    // print(temperature);
    // print(feelLike);
    // print(cityName);
    // print(description);
  }

  void updateWeatherData(
      int temperature,
      int feelLike,
      int wind,
      int maxTemp,
      int humidity,
      int id,
      String cityName,
      String description,
      int imgNumber) {
    setState(() {
      // Update the parameters with the received data
      this.temperature = temperature;
      this.feelLike = feelLike;
      this.wind = wind;
      this.maxTemp = maxTemp;
      this.humidity = humidity;
      this.id = id;
      this.cityName = cityName;
      this.description = description;
      this.imgNumber = imgNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    List<DateTime> weekDates =
        List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBox(
                size: size,
                cityName: cityName,
                onWeatherDataReceived: updateWeatherData,
              ),
              MainBox(
                size: size,
                temperature: temperature,
                feelLike: feelLike,
                description: description,
                imgNumber: imgNumber,
              ),
              WhiteBox(
                size: size,
                feelLike: feelLike,
                wind: wind,
                humidity: humidity,
                maxTemp: maxTemp,
              ),
              const SizedBox(height: 10.0),
              const TextForecast(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var date in weekDates)
                      BottomBox(
                        size: size,
                        dayFormat: DateFormat.E().format(date),
                        dateFormat: DateFormat('dd MMM').format(date),
                        isCurrentDay: date.day == now.day,
                        temperature: temperature,
                        humidity: humidity,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextForecast extends StatelessWidget {
  const TextForecast({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Text(
        "Weekly Forecast",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
