import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselApp extends StatefulWidget {
  const CarouselApp({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<CarouselApp> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List imgList = [
    'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/roa050120dpt-go-betterpics-02-1589997484.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carousel"),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),

            //Slider Container properties
            options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: _controller,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: map<Widget>(imgList, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.grey : Colors.green,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlinedButton(
                  onPressed: goToPrevious,
                  child: const Text("Prev"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    side:
                        const BorderSide(width: 1.0, color: Colors.lightGreen),
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  )),
              OutlinedButton(
                  onPressed: goToNext,
                  child: const Text("Next"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    side:
                        const BorderSide(width: 1.0, color: Colors.lightGreen),
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  goToPrevious() {
    _controller.previousPage();
  }

  goToNext() {
    _controller.nextPage();
  }
}
