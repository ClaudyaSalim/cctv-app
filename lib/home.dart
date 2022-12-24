import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xyz_application/cctv.dart';
import 'package:xyz_application/cctv_page.dart';
import 'package:xyz_application/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List <Cctv> cctvList = []; // fetch data from API / database dalam bentuk seperti dibawah ini
  Cctv cctv1 = Cctv('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', 'CCTV 1', 'Parkiran depan', 'url');
  Cctv cctv2 = Cctv('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', 'CCTV 2', 'Belakang Gedung', 'url');
  Cctv cctv3 = Cctv('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', 'CCTV 3', 'Lobby bagian kanan', 'url');

  Image? cover;

  @override
  void initState() {
    super.initState(); 
    cctvList.add(cctv1);
    cctvList.add(cctv2);
    cctvList.add(cctv3);
    cover = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CCTV list'),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route)=>false);
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: cctvList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context, int i){
          return GridTile(
            child: Padding(
              padding: EdgeInsets.all(24),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cctv_page(cctvURL: cctvList[i].cctvURL, name: cctvList[i].name, desc: cctvList[i].desc)));
                    setState(() {
                      cover = const Image(image: AssetImage('screenshot.jpg'));
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        (cover==null?Icon(Icons.image): Image(image: cover!.image)),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(cctvList[i].name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(cctvList[i].desc, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
            )
          );
        }

        )
    );
  }
}