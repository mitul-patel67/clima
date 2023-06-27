import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constraints/constant.dart';
import 'package:flutter_application_1/screens/search_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

typedef WeatherDataCallback = void Function(
  int temperature,
  int feelLike,
  int wind,
  int maxTemp,
  int humidity,
  int id,
  String cityName,
  String description,
  int imgNumber,
);

class HeaderBox extends StatefulWidget {
  const HeaderBox({
    Key? key,
    required this.size,
    required this.cityName,
    required this.onWeatherDataReceived,
  }) : super(key: key);

  final Size size;
  final WeatherDataCallback onWeatherDataReceived;
  final String cityName;

  @override
  _HeaderBoxState createState() => _HeaderBoxState();
}

class _HeaderBoxState extends State<HeaderBox> {
  File? _imageFile;
  late int temperature;
  late int feelLike;
  late int wind;
  late int maxTemp;
  late int humidity;
  late int id;
  late String cityName;
  late String description;
  late int imgNumber;

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> updateWeatherDataByCityName(String cityName) async {
    const apiKey = 'ea52c1dfdd8993a2ea8d63e03a3f159c';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final weatherData = json.decode(response.body);
      setState(() {
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        double feelDouble = weatherData['main']['feels_like'];
        feelLike = feelDouble.toInt();
        var windDouble = weatherData['wind']['speed'];
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
      });
      widget.onWeatherDataReceived(
        temperature,
        feelLike,
        wind,
        maxTemp,
        humidity,
        id,
        cityName,
        description,
        imgNumber,
      );
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SizedBox(
          height: widget.size.height * 0.10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchIcon(
                  updateWeatherDataByCityName: updateWeatherDataByCityName,
                ),
                Text(
                  widget.cityName,
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    _pickImage(context);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!) as ImageProvider<Object>?
                        : const AssetImage('assets/user_pic.jpg'),
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

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key? key,
    required this.updateWeatherDataByCityName,
  }) : super(key: key);

  final Function(String) updateWeatherDataByCityName;

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final File image = File(pickedFile.path);
        // Process the selected image as needed
      }
    }

    return GestureDetector(
      onTap: () async {
        var cityName = await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const SearchScreen()),
        );
        if (cityName != null) {
          await updateWeatherDataByCityName(cityName);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 45.0,
        height: 45.0,
        decoration: kBoxDecoration.copyWith(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/Search_Icon.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/constraints/constant.dart';
// import 'package:flutter_application_1/screens/search_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';

// typedef WeatherDataCallback = void Function(
//   int temperature,
//   int feelLike,
//   int wind,
//   int maxTemp,
//   int humidity,
//   int id,
//   String cityName,
//   String description,
//   int imgNumber,
// );

// class HeaderBox extends StatefulWidget {
//   const HeaderBox({
//     Key? key,
//     required this.size,
//     required this.cityName,
//     required this.onWeatherDataReceived,
//   }) : super(key: key);

//   final Size size;
//   final WeatherDataCallback onWeatherDataReceived;
//   final String cityName;

//   @override
//   _HeaderBoxState createState() => _HeaderBoxState();
// }

// class _HeaderBoxState extends State<HeaderBox> {
//   File? _imageFile;
//   late int temperature;
//   late int feelLike;
//   late int wind;
//   late int maxTemp;
//   late int humidity;
//   late int id;
//   late String cityName;
//   late String description;
//   late int imgNumber;

//   Future<void> _pickImage(BuildContext context) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> updateWeatherDataByCityName(String cityName) async {
//     const apiKey = 'ea52c1dfdd8993a2ea8d63e03a3f159c';
//     final url = Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final weatherData = json.decode(response.body);
//       setState(() {
//         double temp = weatherData['main']['temp'];
//         temperature = temp.toInt();
//         double feelDouble = weatherData['main']['feels_like'];
//         feelLike = feelDouble.toInt();
//         var windDouble = weatherData['wind']['speed'];
//         wind = windDouble.toInt();
//         id = weatherData['weather'][0]['id'];
//         double maxTempDouble = weatherData['main']['temp_max'];
//         maxTemp = maxTempDouble.toInt();
//         humidity = weatherData['main']['humidity'];
//         cityName = weatherData['name'];
//         description = weatherData['weather'][0]['description'];
//         String num = id.toString();
//         if (num[0] == '2') {
//           imgNumber = 11;
//         } else if (num[0] == '3') {
//           imgNumber = 9;
//         } else if (num[0] == '5') {
//           imgNumber = 10;
//         } else if (num[0] == '6') {
//           imgNumber = 50;
//         } else if (num[0] == '7') {
//           imgNumber = 13;
//         } else if (num[0] == '8') {
//           imgNumber = 2;
//         } else if (num == '800') {
//           imgNumber = 1;
//         } else {
//           imgNumber = 4;
//         }
//       });
//       widget.onWeatherDataReceived(
//         temperature,
//         feelLike,
//         wind,
//         maxTemp,
//         humidity,
//         id,
//         cityName,
//         description,
//         imgNumber,
//       );
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.size.height * 0.10,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SearchIcon(
//               updateWeatherDataByCityName: updateWeatherDataByCityName,
//             ),
//             Text(
//               widget.cityName,
//               style:
//                   const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//             ),
//             GestureDetector(
//               onTap: () {
//                 _pickImage(context);
//               },
//               child: CircleAvatar(
//                 radius: 25,
//                 backgroundImage: _imageFile != null
//                     ? FileImage(_imageFile!) as ImageProvider<Object>?
//                     : const AssetImage('assets/user_pic.jpg'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchIcon extends StatelessWidget {
//   const SearchIcon({
//     Key? key,
//     required this.updateWeatherDataByCityName,
//   }) : super(key: key);

//   final Function(String) updateWeatherDataByCityName;

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _pickImage() async {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         final File image = File(pickedFile.path);
//         // Process the selected image as needed
//       }
//     }

//     return GestureDetector(
//       onTap: () async {
//         var cityName = await Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SearchScreen()),
//         );
//         if (cityName != null) {
//           await updateWeatherDataByCityName(cityName);
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         width: 45.0,
//         height: 45.0,
//         decoration: kBoxDecoration.copyWith(
//           shape: BoxShape.circle,
//         ),
//         child: ClipOval(
//           child: Image.asset(
//             'assets/Search_Icon.png',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
