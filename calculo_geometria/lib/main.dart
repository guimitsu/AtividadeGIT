import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo de Área e Perímetro'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text('Círculo'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CirculoFuncoes();
                  }));
                }),
            ElevatedButton(onPressed: () {}, child: Text('Retângulo')),
          ],
        ),
      ),
    );
  }
}

class CirculoFuncoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Círculo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CirculoArea();
                  }));
                },
                child: Text('Área')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CirculoPerimetro();
                  }));
                },
                child: Text('Perímetro')),
          ],
        ),
      ),
    );
  }
}

class CirculoArea extends StatefulWidget {
  @override
  _CirculoAreaState createState() {
    return _CirculoAreaState();
  }
}

class _CirculoAreaState extends State<CirculoArea> {
  final TextEditingController _diametro = TextEditingController();
  double _area = 0;
  String _resultado = '0';

  void _calcularArea() {
    setState(() {
      _area = (pow(double.tryParse(_diametro.text) / 2, 2) * pi);
      if (_area == null) {
        _resultado = '0';
      } else {
        _resultado = _area.toStringAsPrecision(4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Círculo - Área'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text('Diâmetro em cm:'),
                subtitle: TextField(
                  controller: _diametro,
                  decoration: InputDecoration(hintText: '00.00'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Área:'),
                subtitle: Text('$_resultado cm'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _calcularArea();
                },
                child: Text('Calcular')),
          ],
        ),
      ),
    );
  }
}

class CirculoPerimetro extends StatefulWidget {
  @override
  _CirculoPerimetroState createState() => _CirculoPerimetroState();
}

class _CirculoPerimetroState extends State<CirculoPerimetro> {
  final TextEditingController _diametro = TextEditingController();
  double _perimetro = 0;
  String _resultado = '0';

  void _calcularPerimetro() {
    setState(() {
      _perimetro = (double.tryParse(_diametro.text) * pi);
      if (_perimetro == null) {
        _resultado = '0';
      } else {
        _resultado = _perimetro.toStringAsPrecision(4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Círculo - Perímetro'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text('Diâmetro em cm:'),
                subtitle: TextField(
                  controller: _diametro,
                  decoration: InputDecoration(hintText: '00.00'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Perímetro:'),
                subtitle: Text('$_resultado cm'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _calcularPerimetro();
                },
                child: Text('Calcular')),
          ],
        ),
      ),
    );
  }
}
