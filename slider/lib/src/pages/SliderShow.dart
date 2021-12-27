import 'dart:ffi';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider/src/models/slider_model.dart';

class SliderShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SliderModel(),
        child: Scaffold(
        body: Center(
          child: Column(
            children:[
              Expanded(child: _Slides()),
              _Puntos(),
            ] 
          )
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState(){
    super.initState();
    pageViewController.addListener(() {
      print('Pagina Actual: ${pageViewController.page}');
      //actualizamos el provider del slider model
      Provider.of<SliderModel>(context,listen: false).currentPage = pageViewController.page!;

    });
  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget>[
          _Slide("assets/svgs/slide_1.svg"),
          _Slide("assets/svgs/slide_2.svg"),
          _Slide("assets/svgs/slide_3.svg"),
          _Slide("assets/svgs/slide_4.svg"),
          _Slide("assets/svgs/slide_5.svg"),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: SvgPicture.asset(svg),
    );
    //SvgPicture.asset("assets/svgs/slide_5.svg");
  }
}

class _Puntos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      //color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Punto(0),
          _Punto(1),
          _Punto(2),
          _Punto(3),
          _Punto(4),
        ],
      ),
    );
  }
}

class _Punto extends StatelessWidget {
  final int index;
  _Punto(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return Container(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
       
        color: ( pageViewIndex == index) ? Colors.redAccent : Colors.grey, 
        shape: BoxShape.circle

      ),
    );
  }
}