import 'package:flutter/material.dart';
import '../components/navDrawer.dart';
import '../components/simpleCard.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Collection'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
        children: [
          SimpleCard(
            imageUrl: 'https://source.unsplash.com/200x200/?fire',
            description:
                'This is a random picture from the Unsplash.com with the tag of \'Fire\'',
            tag: 'Fire',
            tagIcon: Icons.whatshot_outlined,
          ),
          SimpleCard(
            imageUrl: 'https://source.unsplash.com/200x200/?water',
            description:
                'This is a random picture from the Unsplash.com with the tag of \'Water\'',
            tag: 'Water',
            tagIcon: Icons.opacity,
          ),
          SimpleCard(
            imageUrl: 'https://source.unsplash.com/200x200/?snow',
            description:
                'This is a random picture from the Unsplash.com with the tag of \'Snow\'',
            tag: 'Snow',
            tagIcon: Icons.ac_unit_rounded,
          ),
          SimpleCard(
              imageUrl: 'https://source.unsplash.com/200x200/?lightning',
              description:
                  'This is a random picture from the Unsplash.com with the tag of \'Lightning\'',
              tag: 'Lightning',
              tagIcon: Icons.flash_on_outlined),
        ],
      ),
    );
  }
}
