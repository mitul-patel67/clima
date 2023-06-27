import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/services/location.dart';
import 'package:flutter_application_1/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = 'ea52c1dfdd8993a2ea8d63e03a3f159c';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location position = Location();
    await position.getCurrentLocation();
    latitude = position.latitude;
    longitude = position.longitude;

    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url);

    dynamic weatherData = await networkHelper.getData();

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) {
        return HomeScreen(
          locationWeather: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: SpinKitDoubleBounce(
          color: Color.fromARGB(255, 154, 96, 229),
          size: 100.0,
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/home_screen.dart';
// import 'package:flutter_application_1/services/location.dart';
// import 'package:flutter_application_1/services/networking.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// const String apiKey = 'ea52c1dfdd8993a2ea8d63e03a3f159c';

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({super.key});

//   @override
//   State<LoadingScreen> createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   double? latitude;
//   double? longitude;
//   @override
//   void initState() {
//     super.initState();
//     getLocationData();
//   }

//   void getLocationData() async {
//     Location position = Location();
//     await position.getCurrentLocation();
//     latitude = position.latitude;
//     longitude = position.longitude;

//     Uri url = Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

//     NetworkHelper networkHelper = NetworkHelper(url);

//     dynamic weatherData = await networkHelper.getData();
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) {
//     //     return HomeScreen(
//     //       locationWeather: weatherData,
//     //     );
//     //   }),
//     // );
//     Navigator.pushAndRemoveUntil(
//       context,
//       CupertinoPageRoute(builder: (context) {
//         return HomeScreen(
//           locationWeather: weatherData,
//         );
//       }),
//       (Route<dynamic> route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: SpinKitDoubleBounce(
//           color: Color.fromARGB(255, 154, 96, 229),
//           size: 100.0,
//         ),
//       ),
//     );
//   }
// }
