import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends StatelessWidget {
  BottomNavController({super.key});

  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;
  final _pages = [
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.greenAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 999),
          top: _drawer == false ? 0 : 100,
          bottom: _drawer == false ? 0 : 100,
          left: _drawer == false ? 0 : 200,
          right: _drawer == false ? 0 : -100,
          child: Container(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: _drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          _drawer.value = true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _drawer.value = false;
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                title: Text(
                  "appbar",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex.value,
                onTap: (value) => _currentIndex.value = value,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Fav"),
                ],
              ),
              body: _pages[_currentIndex.value],
            ),
          ),
        ));
  }
}
