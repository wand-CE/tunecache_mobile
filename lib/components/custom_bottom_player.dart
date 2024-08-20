import 'package:flutter/material.dart';

class CustomBottomPlayer extends StatefulWidget {
  const CustomBottomPlayer({super.key});

  @override
  State<CustomBottomPlayer> createState() => _CustomBottomPlayerState();
}

class _CustomBottomPlayerState extends State<CustomBottomPlayer> {
  double teste = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.white12,
          blurRadius: 8.0,
        ),
      ]),
      child: Column(
        children: [
          Slider.adaptive(
              value: teste,
              onChanged: (value) {
                setState(() {
                  teste = value;
                });
              }),
        ],
      ),
    );
  }
}
