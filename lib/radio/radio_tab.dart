import 'dart:convert';


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamei/radio/radio_item.dart';
import 'package:islamei/radio/radio_response.dart';
import 'package:http/http.dart' as http;

class RadioTab extends StatefulWidget {
  static const String routeName = "radio";

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  var audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var Screensize=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<RadioResponse>(
            future: getRadios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var radios=snapshot.data?.radios??[];
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Image.asset("assets/images/radio_pg.png")),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: PageScrollPhysics(),
                          itemBuilder: (context, index) => SizedBox(width:  Screensize.width*0.9,
                              child:

                          RadioItem(radio:radios[index],audioPlayer: audioPlayer,)),
                          itemCount: radios.length,
                        ),
                      )
                    ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.hasError ?? ""}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<RadioResponse> getRadios() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(json);
    } else {
      throw Exception("Failed to toad radios");
    }
  }
}
