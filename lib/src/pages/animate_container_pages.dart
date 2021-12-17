import 'dart:math';

import 'package:flutter/material.dart';

class AnimateContainerPages extends StatefulWidget {
  const AnimateContainerPages({Key? key}) : super(key: key);

  @override
  _AnimateContainerPagesState createState() => _AnimateContainerPagesState();
}

class _AnimateContainerPagesState extends State<AnimateContainerPages> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.deepPurpleAccent;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration:  const Duration(seconds: 1),
          curve: Curves.easeInQuad,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: _cambairForma,
      ),
    );
  }

  void _cambairForma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(500).toDouble());
    });
  }
}
