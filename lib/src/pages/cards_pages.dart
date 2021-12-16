import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardtipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardtipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardtipo2(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardtipo2(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que esta haciendo esta parte '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Cancelar')),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardtipo2() {
    var card = Container(
      child: Column(
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://f.vividscreen.info/soft/e880b455021e610249371b065945495b/Anime-Landscape-in-Broken-City-wide-i.jpg'),
            fadeInDuration: Duration(milliseconds: 400),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('No tengo idea de que poner'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 15.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: card,
      ),
    );
  }
}
