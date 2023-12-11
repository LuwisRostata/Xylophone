import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

void playSound(int A){
  final player = AudioPlayer();
  player.play(AssetSource('note$A.wav'));
}

Expanded keys(int A, Color B){
  return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: B,
              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
              enableFeedback: false
          ),
          onPressed: (){
            playSound(A);
          },
          child: Container()
      )
  );
}
Color RandomC=Colors.purple;

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}
class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              keys(1,Colors.red),
              keys(2,Colors.orange),
              keys(3,Colors.yellow),
              keys(4,Colors.lightGreen),
              keys(5,Colors.green),
              keys(6,Colors.blue),
              keys(7,Colors.indigo),
              Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: RandomC,
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          enableFeedback: false
                      ),
                      onPressed: (){
                        playSound(Random().nextInt(7));
                        setState(() {
                          RandomC
                          =Colors.primaries[Random().nextInt(Colors.primaries.length)];
                        });
                      },
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                          'Play random note',
                          style: TextStyle(
                              fontFeatures: <FontFeature>[FontFeature.enable('smcp')],
                              fontSize:30,
                              color: Colors.white),
                        ),
                        ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
