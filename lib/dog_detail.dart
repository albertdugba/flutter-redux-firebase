import 'package:flutter/material.dart';
import 'package:screen_lock/dog_model.dart';

class DogDetails extends StatefulWidget {
  final Dog dog;
  DogDetails(this.dog);
  @override
  _DogDetailsState createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  final double dogAvatarSize = 115.0;

  Widget get dogImage {
    return Container(
        height: dogAvatarSize,
        width: dogAvatarSize,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          const BoxShadow(
              // just like CSS:
              // it takes the same 4 properties
              offset: const Offset(1.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: -1.0,
              color: const Color(0x33000000)),
          const BoxShadow(
              offset: const Offset(2.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              color: const Color(0x24000000)),
          const BoxShadow(
              offset: const Offset(3.0, 1.0),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              color: const Color(0x1F000000)),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
