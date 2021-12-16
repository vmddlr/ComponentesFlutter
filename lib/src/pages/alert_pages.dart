
import 'package:flutter/material.dart';

class AlertPages extends StatelessWidget{
  const AlertPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Pages'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        },
      )
    );
  }
}