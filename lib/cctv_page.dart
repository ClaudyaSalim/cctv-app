import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:screenshot/screenshot.dart';
import 'package:video_player/video_player.dart';
import 'package:xyz_application/login.dart';

class cctv_page extends StatefulWidget {
  const cctv_page({required this.cctvURL, required this.name, required this.desc});

  final String cctvURL, name, desc;

  @override
  State<cctv_page> createState() => _cctv_pageState();
}

class _cctv_pageState extends State<cctv_page> {

  late VideoPlayerController controller;
  ScreenshotController sscontroller = ScreenshotController();
  late Future<void> videoFuture;

  @override
  void initState() {
    super.initState(); 
    controller = VideoPlayerController.network(widget.cctvURL);
    videoFuture = controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name), // nama CCTV nya di appBar
        actions: [
          ElevatedButton(
            onPressed: (){
              sscontroller.capture().then((capturedImage) async {
                  print('image captured');});
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route)=>false);
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(48),
          child: Column(
            children: [
              Text(widget.desc),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder(
                future: videoFuture,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    controller.play();
                    return Screenshot(
                      controller: sscontroller,
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller), 
                      )
                    );
                  }
                  else {
                    return CircularProgressIndicator();
                  }
                }
              ),
            ],
          ),
        ),
      )
    );
  }
}