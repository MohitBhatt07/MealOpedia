import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/youtube_screen.dart';

class MiddleNavigationBarPage extends StatefulWidget {
  final List<String>? steps;
  final List<String>? ingredients;
  final String? videoAddress;
  MiddleNavigationBarPage({
    this.steps,
    this.ingredients,
    this.videoAddress,
  });
  @override
  _MiddleNavigationBarPageState createState() =>
      _MiddleNavigationBarPageState();
}

class _MiddleNavigationBarPageState extends State<MiddleNavigationBarPage> {
  int _currentIndex = 0;

  Widget videoContent() {
    return Container(
        margin: const EdgeInsets.all(40),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return YoutubePlayerExample();
            }));
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color.fromARGB(255, 245, 208, 141),
              child: Stack(
                children: [
                  Positioned(
                      top: 5,
                      right: 5,
                      left: 5,
                      bottom: 5,
                      child: Image.asset('assets/videotutorial.png')),
                  const Positioned(
                    top: 60,
                    left: 110,
                    child: Icon(
                      Icons.play_circle,
                      size: 80,
                    ),
                  )
                ],
              )),
        ));
  }

  Widget tabBarContent(
    BuildContext ctx,
    List<String> currList,
    Color currColor,
  ) {
    int count = 1;
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.all(3),
      color: Colors.transparent,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                //border: Border,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: const Offset(2, 6),
                      color: currColor)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                const Color.fromARGB(255, 135, 18, 231),
                            radius: 10,
                            child: Text(
                              (count++).toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            currList[index],
                            softWrap: true,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
        itemCount: currList.length,
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: BottomNavigationBar(
            //type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromARGB(255, 89, 209, 28),
            currentIndex: _currentIndex,
            onTap: _onNavItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Recipe',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined),
                label: 'Ingredients',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Video Tutorial',
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          color: Colors.white,
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    int count = 1;
    switch (_currentIndex) {
      case 0:
        return tabBarContent(
          context,
          widget.steps!,
          const Color.fromARGB(255, 129, 196, 252),
        );
      case 1:
        return tabBarContent(
          context,
          widget.ingredients!,
          const Color.fromARGB(255, 248, 189, 111),
        );

      case 2:
        return videoContent();
      // return ElevatedButton(
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      //         return YoutubePlayerExample();
      //       }));
      //     },
      //     child: const Text('yt player'));

      //return MiniYoutubePlayer(videoAddress: widget.videoAddress!);

      default:
        return Container(
          height: 20,
        );
    }
  }
}
