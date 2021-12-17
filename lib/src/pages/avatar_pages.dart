import 'package:flutter/material.dart';

class AvatarPages extends StatelessWidget {
  const AvatarPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Pages'),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://pendulo.com/imagenes_grandes/9788441/978844154266.GIF'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.amberAccent,
            ),
          )
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FadeInImage(
            image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/81bvICgowRL.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}
