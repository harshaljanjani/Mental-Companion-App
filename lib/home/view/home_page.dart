import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_companion/home/controller/home_controller.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({Key? key}) : super(key: key);
  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  final _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor: Colors.black,
        title: const Text('Ready When You Are!', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () => null,
          backgroundColor: Colors.black,
          child: const Icon(Icons.camera, size: 50),
        ),
      ),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          _homeController.startImageStream();
        },
        builder: (_) {
          return
            Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFffdc00), Colors.deepOrange]),
            ),
            child: Column(
            children: [
              _.cameraController != null &&
                      _.cameraController!.value.isInitialized
              ? Container(
                padding: const EdgeInsets.fromLTRB(0,14,0,0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(15,15,15,15),
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Colors.red, Colors.blueAccent]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    elevation: 4.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide(width: 14, color: Colors.black)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CameraPreview(_.cameraController!),
                    ),
                  ),
                )
              )
                  : const Center(child: Text('Loading Camera Preview...', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold))),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  color : Colors.white.withOpacity(0),
                  alignment: Alignment.center,
                  width: 200,
                  height: 140,
                  child: Image.asset(
                    'images/${_.faceAtMoment}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                '${_.label}',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
            );
        },
      ),
    );
  }
}

