import 'package:flutter/material.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  _App({Key? key}) : super(key: key);

  // White Material Color
  MaterialColor whiteMC = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  // TimePicker Theme
  final _timePickerTheme = const TimePickerThemeData(
    backgroundColor: Color(0xff3b3a44),
    hourMinuteTextColor: Colors.white,
    hourMinuteColor: Color(0xff1b313e),
    dayPeriodTextColor: Colors.white,
    dayPeriodColor: Color(0xff1b313e),
    dialHandColor: Color(0xffa1ab32),
    dialBackgroundColor: Color(0xff1b313e),
    dialTextColor: Colors.white,
    entryModeIconColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Practice',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: whiteMC,
          timePickerTheme: _timePickerTheme),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3b3a44),
      appBar: AppBar(
        backgroundColor: const Color(0xff1b313e),
        leading: const Drawer(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: const Text('Flutter Practice',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2023, 12, 31));
                },
                child: const Text('Show Calendar',
                    style: TextStyle(color: Colors.black))),
            ElevatedButton(
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      anchorPoint: const Offset(50, 2000));
                },
                child: const Text('Show Time',
                    style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
