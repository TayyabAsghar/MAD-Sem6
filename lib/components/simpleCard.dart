import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  const SimpleCard(
      {@required this.imageUrl,
      this.description,
      @required this.tagIcon,
      @required this.tag});

  final imageUrl;
  final description;
  final tagIcon;
  final tag;

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  static IconData _toggleIcon = Icons.favorite_border_outlined;
  static Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageUrl;
    final description = widget.description;
    final tagIcon = widget.tagIcon;
    final tag = widget.tag;
    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 16,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: NetworkImage(imageUrl),
                    height: 200,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      _toggleIcon,
                      color: _color,
                    ),
                    onPressed: () => setState(
                      () {
                        if (_toggleIcon != Icons.favorite) {
                          _color = Colors.red;
                          _toggleIcon = Icons.favorite;
                        } else {
                          _color = Colors.black;
                          _toggleIcon = Icons.favorite_border_outlined;
                        }
                      },
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(tagIcon),
                    label: Text(tag),
                  )
                ],
              )
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
