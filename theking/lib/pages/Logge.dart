import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theking/pages/contacto_page.dart';
import 'package:theking/pages/menu_page.dart';
import 'package:theking/pages/pedido_page.dart';
import 'package:theking/providers/google_sign.dart';
import 'package:provider/provider.dart';

class LoggenInWidget extends StatefulWidget {
  LoggenInWidget({this.uid});
  final String? uid;
  @override
  _LoggenInWidgetState createState() => _LoggenInWidgetState();
}

class _LoggenInWidgetState extends State<LoggenInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          title: Text("THE KING"),
        ),
        body: ListView(children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardPublicidad(
                    "Anuncio 1",
                    "Sed egestas rutrum nisi, ac sollicitudin elit laoreet laoreet. Aliquam lacinia porttitor blandit. Suspendisse potenti. Donec gravida metus augue, viverra dictum erat efficitur eu.",
                    "assets/images/anuncio1.jpeg"),
                cardPublicidad(
                    "Anuncio 2",
                    "Sed egestas rutrum nisi, ac sollicitudin elit laoreet laoreet. Aliquam lacinia porttitor blandit. Suspendisse potenti. Donec gravida metus augue, viverra dictum erat efficitur eu.",
                    "assets/images/anuncio2.jpeg"),
                cardPublicidad(
                    "Anuncio 2",
                    "Sed egestas rutrum nisi, ac sollicitudin elit laoreet laoreet. Aliquam lacinia porttitor blandit. Suspendisse potenti. Donec gravida metus augue, viverra dictum erat efficitur eu.",
                    "assets/images/anuncio2.jpeg"),
              ],
            ),
          ),
        ]),
        drawer: NavigaterDrawerr());
  }
}

cardPublicidad(titulo, descripcion, imagen) {
  return Container(
    margin: new EdgeInsets.all(15),
    height: 200.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
    child: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          child: Image(
            image: AssetImage(imagen),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  titulo,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    descripcion,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                    maxLines: 10,
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                animationDuration: Duration(seconds: 2)
              ),
              child: Row(
                children: [
                  Text('Detalle',
                  style: TextStyle(color: Colors.amber),),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.amber,
                  ),
                ],
              ),
              onPressed: (){
                print('Articulo'+titulo);
              },
            )
          ],
        ),
      ],
    )),
  );
}

class NavigaterDrawerr extends StatefulWidget {
  const NavigaterDrawerr({
    Key? key,
  }) : super(key: key);

  @override
  _NavigaterDrawerrState createState() => _NavigaterDrawerrState();
}

class _NavigaterDrawerrState extends State<NavigaterDrawerr> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.amber),
            currentAccountPicture: new Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.photoURL!)),
              ),
            ),
            accountName: Text(user.displayName!),
            accountEmail: Text(user.email!),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Inicio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoggenInWidget()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.menu, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Menú'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.card_giftcard, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Pedido'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PedidoPage()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.contact_page, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Contacto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactoPage()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.logout, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Cerrar Sesión'),
            onTap: () {
              setState(() {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              });
            },
          ),
        ],
      ),
    );
  }
}
