import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/producto.dart';

class DatabaseService {
  CollectionReference productosCollection =
      FirebaseFirestore.instance.collection("Productos");
  CollectionReference usersCollection = 
      FirebaseFirestore.instance.collection("Usuarios");

  Future crearProducto(String nombre,String tipo, String precioReg, String precioVen) async {
    return await productosCollection.add({
      "nombre": nombre,
      "tipo": tipo,
      "precioReg": precioReg,
      "precioVen": precioVen,
    });
  }


  Future eliminarProducto(id) async {
    await productosCollection.doc(id).delete();
  }


  List<Producto> productoFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Producto(
          nombre: e.data()["nombre"],
          tipo: e.data()["tipo"],
          precioReg: e.data()["precioReg"],
          precioVen: e.data()["precioVen"],
          id: e.id,
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<Producto>> listTodos() {
    return productosCollection.snapshots().map(productoFirestore);
  }

}
