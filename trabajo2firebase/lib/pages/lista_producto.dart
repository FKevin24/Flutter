import 'package:flutter/material.dart';
import 'package:todo_app/pages/agregar_producto.dart';
import 'package:todo_app/provider/sign_user.dart';
import 'package:todo_app/utils/loading.dart';
import 'package:todo_app/model/producto.dart';
import 'package:todo_app/services/DB_servicios.dart';

import 'login.dart';

class ListaProductos extends StatefulWidget {
  @override
  _ListaProductosState createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            onPressed: (){
            setState(() {
              AuthenticationHelper().signOut()
              .then((value) => Navigator
              .of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInApp()),(route) => false));
              });
            }, icon: new Icon(Icons.exit_to_app)
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Producto>>(
            stream: DatabaseService().listTodos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }
              List<Producto> productos = snapshot.data;
              return Padding(
                padding: EdgeInsets.all(25),
                child: SingleChildScrollView(
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[800],
                        ),
                        shrinkWrap: true,
                        itemCount: productos.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.grey[600]),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                            ),
                            key: Key(productos[index].nombre),
                            child: ListTile(
                              onTap: () {
                              },
                              leading: Icon(Icons.star_rate_outlined),
                              title: Text(
                                productos[index].nombre,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                productos[index].tipo,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ), 
                              trailing: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Precio Venta: '+productos[index].precioVen),
                                    SizedBox(height: 10.0,),
                                    Text('Precio Regular: '+productos[index].precioReg)
                                  ]
                                ),
                              ), 
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {  
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AgregarProducto())); 
        },
      ),
    );
  }
}

