import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPages extends StatefulWidget {
  const ListViewPages({Key? key}) : super(key: key);

  @override
  _ListViewPagesState createState() => _ListViewPagesState();
}

class _ListViewPagesState extends State<ListViewPages> {

  final ScrollController _scrollController = ScrollController();

  final List<int> _listNumber = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fechtData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        )

    );
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumber.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _listNumber[index];

            return FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/500/300/?image=$image')
            );
          }
      ),
    );
  }

  Future<Null> _obtenerPagina() async{
      const duration = Duration(seconds: 2);
      Timer(duration, (){
        _listNumber.clear();
        _ultimoNumero++;
        _agregar10();
      });

      return Future.delayed(duration);
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listNumber.add(_ultimoNumero);

      setState(() {});
    }
  }

  Future _fechtData() async {
    _isLoading = true;
    setState(() {});

    const duration = Duration(seconds: 2);
    return Timer(duration, _respuestaHTTP);
  }

  _respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn
    );
    
    _agregar10();
  }

  _crearLoading() {
    if (_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
            const SizedBox( height: 16.0,)
          ]
      );
    } else {
    return Container();
    }
  }
}

