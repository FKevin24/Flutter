import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('Icono Search');
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('Icono Mensaje');
        },
        icon: Icons.message_sharp),
    PinterestButton(
        onPressed: () {
          print('Icono Notificacion');
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('Icono Equipo');
        },
        icon: Icons.supervisor_account),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinterestTapBar(items: items),
    );
  }
}

class _PinterestTapBar extends StatelessWidget {
  const _PinterestTapBar({
    required this.items,
  });
  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _MenuItems(items),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 20, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          item.onPressed.call();
        },
        child: Container(
          child:  Icon(item.icon),
        ));
  }
}
