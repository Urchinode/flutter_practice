import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(const _App());
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flutter Practice',
      debugShowCheckedModeBanner: false,
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
  String text = '';
  List items = List.empty(growable: true);
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  void getData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=doit');
    var response = await http.get(url,
        headers: {'Authorization': 'KakaoAK APIKEY'}); // `APIKEY` 자리에 카카오 REST API KEY를 입력해야함
    setState(() {
      var newData = json.decode(response.body)['documents'];
      items.addAll(newData);
      items.forEach(print);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        page++;
        print('fetch next page');
        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Flutter Practice',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Center(
        child: items.isNotEmpty
            ? ListView.builder(
                controller: _scrollController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(items[index]['thumbnail'])),
                      Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(children: [
                            Text(items[index]['title']),
                            Text(items[index]['price'].toString()),
                            Text(items[index]['authors'].isNotEmpty
                                ? items[index]['authors'][0]
                                : '?')
                          ])),
                    ],
                  ));
                },
              )
            : const Text('Press the button below'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        page = 1;
        items.clear();
        getData();
      }),
    );
  }
}
