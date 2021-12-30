import 'package:flutter/material.dart';

class InputPages extends StatefulWidget {
  const InputPages({Key? key}) : super(key: key);

  @override
  _InputPagesState createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {
  String _name = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  final List<String> _poderes = [
    'Volar',
    'Rayos x',
    'Super alientp',
    'Super fuerza'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearComponentes(),
            const Divider(),
            _crearCorreo(),
            const Divider(),
            _crearContrasena(),
            const Divider(),
            _crearFecha(context),
            const Divider(),
            _crearDropDown(),
            const Divider(),
            _crearPersona(),
          ],
        ));
  }

  Widget _crearComponentes() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          counter: Text('Letras ${_name.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Nombre completo',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (text) {
        setState(() {
          _name = text;
          print('El texto es $text');
        });
      },
    );
  }

  Widget _crearCorreo() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            // hintText: 'Correo',
            labelText: 'Correo',
            helperText: 'Correo completo',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (text) => setState(() {
              _email = text;
              print('El texto es $text');
            }));
  }

  Widget _crearContrasena() {
    return TextField(
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            // hintText: 'Correo',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.password),
            icon: Icon(Icons.lock)),
        onChanged: (text) => setState(() {
              _email = text;
              print('El texto es $text');
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          // hintText: 'Correo',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> _getOptDrown() {
    List<DropdownMenuItem<String>> lista = [];

    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    }

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0,),
        DropdownButton(
          value: _opcionSeleccionada,
          items: _getOptDrown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt.toString();
            });
          },
        )
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_name'),
      subtitle: Text('El correo es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
