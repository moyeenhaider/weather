import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double latitude;
  // double longitude;
  // String city;
  // String temp;
  // int id;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getLocationData();

    super.initState();
    //once load when state build
  }

  getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var whetherData = await weatherModel.getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) => LocationScreen(
                  locationWether: whetherData,
                )));
  }

  // getData() async {
  //   http.Response response = await http.get(
  //       'http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     print(data);
  //     String city = jsonDecode(data)['name'];
  //     double temp = jsonDecode(data)['main']['temp'];
  //     int condition = jsonDecode(data)['weather'][0]['id'];
  //     print(city);
  //     print(temp);
  //     print(condition);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Whether"),
      ),
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 75.0,
      )),
    );
  }
}

// Container(
//         margin: EdgeInsets.all(marginAsDouble ?? 30),
//         color: Colors.redAccent,
//       ),
