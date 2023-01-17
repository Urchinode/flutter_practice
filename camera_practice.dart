import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =await availableCameras();
  runApp(_App(cameras: cameras));
}

class _App extends StatelessWidget {
  const _App({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainPage(cameras: cameras),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late CameraController cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(widget.cameras[0],ResolutionPreset.high);
    cameraValue = cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Practice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              FutureBuilder(
                  future: cameraValue,
                  builder: (context,snapshot) {
                    if(snapshot.connectionState==ConnectionState.done){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 800,
                            width: 800,
                            child: cameraController.value.isInitialized
                                ? CameraPreview(cameraController)
                                : const Text('Camera Off'),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            child: const Text('On Camera'),
                            onPressed: () {
                            },
                          ),
                        ],
                      );
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
