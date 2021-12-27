import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestro Menú'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
                productoMenu(),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

productoMenu() {
  return Container(
    height: 150,
    color: Colors.amber,
  );
}
