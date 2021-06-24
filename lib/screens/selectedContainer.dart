import 'package:flutter/material.dart';
import 'package:mobile_app_dev_sem_6/screens/video.dart';
import '../components/carouselContainer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SelectedContainer extends StatefulWidget {
  const SelectedContainer({@required this.details});
  final Map<String, Object> details;

  @override
  _SelectedContainerState createState() => _SelectedContainerState();
}

class _SelectedContainerState extends State<SelectedContainer> {
  @override
  Widget build(BuildContext context) {
    final details = widget.details;

    return Hero(
      tag: details['title'],
      child: Scaffold(
        appBar: AppBar(
          title: Text(details['title']),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.8,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
            ),
            items: [
              CarouselContainer(
                color: Theme.of(context).primaryColor,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  child: Center(
                    child: Text(
                      details['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              CarouselContainer(
                color: Colors.primaries.elementAt(14),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: details['widgets'] != null
                        ? (details['widgets'] as List<String>)
                            .map(
                              (e) => Text(
                                '- $e',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                            .toList()
                        : [Container()],
                  ),
                ),
              ),
              CarouselContainer(
                color: Colors.red[900],
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(details['image_url']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              CarouselContainer(
                color: Colors.blue[900],
                child: Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Video(url: details['video_url']),
                      ),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.video_collection, color: Colors.white),
                          Text(
                            'Play Video',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
