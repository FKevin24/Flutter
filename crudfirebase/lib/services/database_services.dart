import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo.dart';

class DatabaseService {

  CollectionReference todosCollection = FirebaseFirestore.instance.collection("productos");

  Future createNewTodo(String title, String precio, String descripcion) async {
    return await todosCollection.add({
      "nombre": title,
      "precio": precio, 
      "descripcion": descripcion,
      "disponible": false,
    });
  }

  Future completTask(uid) async {
    await todosCollection.doc(uid).update({"disponible": true});
  }

  Future removeTodo(uid) async {
    await todosCollection.doc(uid).delete();
  }

  List<Productos> todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Productos(
          disponible: e.data()["disponible"],
          nombre: e.data()["nombre"],
          precio: e.data()["precio"],
          descripcion: e.data()["descripcion"],
          uid: e.id,
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<Productos>> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }
}
