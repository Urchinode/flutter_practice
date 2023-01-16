import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String result = '서울역';
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.width = '100%';
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.border = 'none';
    _iFrameElement.src =
        'https://www.google.com/maps/embed/v1/place?key=AIzaSyAH5Oo3r-1Z3iGBKxoyh6-i3_iFMQFzWj0&q=$result&region=KR&language=ko';

    // ignore:undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('iframeElement', (int ViewId) => _iFrameElement);

    super.initState();
  }

  final Widget _iframeWidget =
      HtmlElementView(viewType: 'iframeElement', key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Practice'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.95,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      onChanged: (String value) {
                        result = value;
                      },
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    )),
                    ElevatedButton(
                        onPressed: () async {
                          var url =
                              'https://www.google.com/maps/embed/v1/place?key=AIzaSyAH5Oo3r-1Z3iGBKxoyh6-i3_iFMQFzWj0&q=$result&region=KR&language=ko';
                          var response = await http.get(Uri.parse(url));
                          setState(() {
                            _iFrameElement.src = url;
                            // ignore:undefined_prefixed_name
                            ui.platformViewRegistry
                                .registerViewFactory('iframeElement', (int ViewId) => _iFrameElement);
                          });
                        },
                        child: const Text('Go To Map')),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: _iframeWidget,
                ),
                Text(result),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
