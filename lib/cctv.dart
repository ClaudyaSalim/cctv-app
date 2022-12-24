import 'dart:html';

class Cctv {
  late String cctvURL;
  late String name;
  late String desc;
  late String imgURL;

  Cctv (String cctvURL, String name, String desc, String imgURL){
    this.cctvURL = cctvURL;
    this.name = name;
    this.desc = desc;
    this.imgURL = imgURL;
  }
}