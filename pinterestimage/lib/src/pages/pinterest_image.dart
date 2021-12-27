import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class PinterestImage extends StatefulWidget {
  @override
  _PinterestImageState createState() => _PinterestImageState();
}

class _PinterestImageState extends State<PinterestImage> {
  List<String> imageList = [
    'https://picsum.photos/seed/1/800/800',
    'https://picsum.photos/seed/2/800/800',
    'https://picsum.photos/seed/3/800/800',
    'https://picsum.photos/seed/4/800/800',
    'https://picsum.photos/seed/5/800/800',
    'https://picsum.photos/seed/6/800/800',
    'https://picsum.photos/seed/7/800/800',
    'https://picsum.photos/seed/8/800/800',
    'https://picsum.photos/seed/9/800/800',
    'https://picsum.photos/seed/10/800/800',
    'https://picsum.photos/seed/11/800/800',
    'https://picsum.photos/seed/12/800/800',
    'https://picsum.photos/seed/13/800/800',
    'https://picsum.photos/seed/14/800/800',
    'https://picsum.photos/seed/15/800/800',
    'https://picsum.photos/seed/16/800/800',
    'https://picsum.photos/seed/17/800/800',
    'https://picsum.photos/seed/18/800/800',
    'https://picsum.photos/seed/19/800/800',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(12),
          child: new StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: imageList.length,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect( 
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(
                    (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1
                );
              }
          )
      ),
    );
  }
  
}
