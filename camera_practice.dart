import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraTestPage extends StatefulWidget {
  const CameraTestPage({super.key});

  @override
  State<CameraTestPage> createState() => _CameraTestPageState();
}

class _CameraTestPageState extends State<CameraTestPage> {
  late final List<CameraDescription> cameras;
  late final CameraController cameraController;
  late Future<void> cameraValue;

  Future<void> initiateCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    initiateCamera();
    super.initState();
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
        title: const Text('Camera Test'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              FutureBuilder(
                  future: cameraValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
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
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
