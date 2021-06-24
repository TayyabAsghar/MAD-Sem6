import 'package:mobile_app_dev_sem_6/screens/selectedContainer.dart';

import '../utils/constants.dart';
import '../components/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWithVideoPlayer extends StatefulWidget {
  @override
  _SliderWithVideoPlayerState createState() => _SliderWithVideoPlayerState();
}

class _SliderWithVideoPlayerState extends State<SliderWithVideoPlayer> {
  Map<String, Object> selectedPage = SLIDER_DATA[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.8,
            enableInfiniteScroll: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (val, _) => setState(
              () => selectedPage = SLIDER_DATA[val],
            ),
          ),
          items: SLIDER_DATA
              .map(
                (e) => GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF2D2F41),
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        Hero(
                          tag: e['title'],
                          child: Opacity(
                            opacity: 0.7,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(
                                    e['image_url'],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            e['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      // To decrease the duration of the page Animation
                      transitionDuration: Duration(seconds: 1),
                      pageBuilder: (_, __, ___) =>
                          SelectedContainer(details: selectedPage),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
