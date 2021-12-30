import 'package:flutter/material.dart';

class SliderPages extends StatefulWidget {
  const SliderPages({Key? key}) : super(key: key);

  @override
  _SliderPagesState createState() => _SliderPagesState();
}

class _SliderPagesState extends State<SliderPages> {
  double _slideValue = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckBox(),
              _crearSwitch(),
              Expanded(child: _crearImagen()),
            ],
          )),
    );
  }

  _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        // divisions: 20,
        value: _slideValue,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck) ? null :  (valor) {
          setState(() {
            _slideValue = valor;
          });

          print(valor);
        });
  }

  _crearCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor!;
          });
        }
    );
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor!;
          });
        }
    );
  }

  _crearImagen() {
    return Image(
      image: const NetworkImage(
          'https://graffica.info/wp-content/uploads/batman.png'),
      width: _slideValue,
      fit: BoxFit.contain,
    );
  }


}
