import 'package:flutter/material.dart';

import '../utils/get_location.dart';
import '../widgets/custom_scaffold.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    print('Get current location');
    determinePosition().then((value) {
      setState(() {
        latitude = value.latitude;
        longitude = value.longitude;
      });
    });
    print('Complete getting current location');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        body: Center(
      child: latitude == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('내 위치 확인 중...'),
                SizedBox(height: 80),
                CircularProgressIndicator(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(latitude.toString()),
                        const SizedBox(width: 60),
                        Text(longitude.toString()),
                      ]),
                ),
              ],
            ),
    ));
  }
}
