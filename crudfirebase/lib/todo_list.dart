import 'package:flutter/material.dart';
import 'package:todo_app/loading.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/services/database_services.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplet = false; // just for now
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Productos>>(
            stream: DatabaseService().listTodos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }
              List<Productos> productos = snapshot.data;
              return Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lista",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey[600],
                      height: 10.0,
                    ),
                    SizedBox(height: 20),
                    ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[800],
                      ),
                      shrinkWrap: true,
                      itemCount: productos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(productos[index].nombre),
                          background: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          onDismissed: (direction) async {
                            await DatabaseService()
                                .removeTodo(productos[index].uid);
                            //
                          },
                          child: ListTile(
                            onTap: () {
                              DatabaseService().completTask(productos[index].uid);
                            },
                            leading: Container(
                              padding: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: productos[index].disponible
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                  )
                                  : Container(),
                            ),
                            title: Text(
                              productos[index].nombre,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              productos[index].descripcion,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              productos[index].precio,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w600,
                              ),
                            ),  
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            builder: (context) => SimpleDialog(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              backgroundColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Row(
                children: [
                  Text(
                    "Ingrese su producto",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              children: [
                Divider(),
                TextFormField(
                  controller: nombreController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Ingres el Nombre",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: precioController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Ingres el Precio",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  controller: descripcionController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Describa su producto",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    
                    child: Text("Agregar"),
                    onPressed: () async {
                      if (nombreController.text.isNotEmpty & precioController.text.isNotEmpty & descripcionController.text.isNotEmpty) {
                        await DatabaseService()
                            .createNewTodo(nombreController.text.trim(),precioController.text.trim(),descripcionController.text.trim());
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ), context: context,
          );
        },
      ),
    );
  }
}
