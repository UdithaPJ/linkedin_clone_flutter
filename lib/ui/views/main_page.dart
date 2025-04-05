import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  onTapOnTab(int index) {

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 22,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color(0xFF8d8d8d),
            selectedFontSize: 11,
            unselectedFontSize: 11,
            showUnselectedLabels: true,
            onTap: onTapOnTab,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.house_fill, size: 25,),
                  label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.userGroup, size: 22,),
                label: "My Network",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.solidSquarePlus, size: 25,),
                label: "Post",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.bell_fill, size: 25,),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.briefcase,),
                label: "Jobs",
              ),
            ],
          ),
          body: _children[_currentIndex],
        ),
    );
  }
}
