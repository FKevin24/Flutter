import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  
  final _estiloTexto = new TextStyle(fontSize: 20);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        elevation: .5,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numero de clicks:', style: _estiloTexto),
            Text( '$_conteo' , style: _estiloTexto),
          ],
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }

  Widget _crearBotones(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox( width: 30.0, ),
        FloatingActionButton(onPressed: _reset,backgroundColor: Colors.amber,child: Icon(Icons.exposure_zero)),
        Expanded(child: SizedBox()),
        FloatingActionButton(onPressed: _sustraer,backgroundColor: Colors.amber,child: Icon(Icons.remove)),
        SizedBox( width: 5.0, ),
        FloatingActionButton(onPressed: _agregar,backgroundColor: Colors.amber,child: Icon(Icons.add)),
      ],
    ); 
  }

  void _agregar(){
    setState(() {
      _conteo++;
    });
  }
  void _sustraer(){
    setState(() {
      _conteo--;
    });
  }
  void _reset(){
    setState(() {
      _conteo = 0;
    });
  }
}