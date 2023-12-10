import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          currentIndex: pageIndex,
          onTap: (index) {
            pageIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CustomIcon(),
            ),
            BottomNavigationBarItem(
              label: 'Message',
              icon: Icon(
                Icons.message,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            )
          ]),
      body:  Center(
        child: pages[pageIndex],
      ),
    );
  }
}
