import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamei/radio/radio_response.dart';

class RadioItem extends StatefulWidget {
  Radios radio;
  AudioPlayer audioPlayer;

  RadioItem({required this.radio, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.radio.name ?? "",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: play, icon: const Icon(Icons.play_arrow)),
              IconButton(onPressed: pause, icon: const Icon(Icons.pause)),
            ],
          ),
        )
      ],
    );
  }

  void play() async {
    if (widget.radio.url != null) {
      await widget.audioPlayer.play(UrlSource(widget.radio.url!));
    }
  }

  void pause() async {
    await widget.audioPlayer.pause();
  }
}
