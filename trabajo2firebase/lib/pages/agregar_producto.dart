import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/services/DB_servicios.dart';

class AgregarProducto extends StatefulWidget {

  @override
  _AgregarProductoState createState() => _AgregarProductoState();
}

class _AgregarProductoState extends State<AgregarProducto> {

  TextEditingController nombreController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController precioRegController = TextEditingController();
  TextEditingController precioVenController = TextEditingController();

  String dropdownvalue = 'Simple';
  var _tipos =['Simple','Marca','Genérico'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Nombre del Producto',
                  labelText: 'Nombre',
                  icon: Icon(Icons.add_shopping_cart)  
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerRight,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.grey[600]),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 300.0,
                      padding: EdgeInsets.symmetric(horizontal:50,vertical: 5),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        elevation: 20,
                        items: _tipos.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem)
                          );
                        }).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            this.dropdownvalue = newValue;
                          });
                        },
                        value: dropdownvalue,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              TextField(controller: precioRegController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Precio Regular',
                  labelText: 'Precio Regular',
                  icon: Icon(Icons.monetization_on)  
                ),),
              Divider(),
              TextField(controller: precioVenController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  hintText: 'Precio Venta',
                  labelText: 'Nombre Venta',
                  icon: Icon(Icons.monetization_on)  
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(onPressed: () async {
                      if (nombreController.text.isNotEmpty & dropdownvalue.isNotEmpty & precioVenController.text.isNotEmpty & precioRegController.text.isNotEmpty) {
                        await DatabaseService()
                            .crearProducto(nombreController.text.trim(), dropdownvalue.trim(),precioRegController.text.trim(),precioVenController.text.trim());
                        Navigator.pop(context);
                      }
                    },
                child: Text('Guardar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
