import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkedinAppBar extends StatefulWidget {
  final String hintText;
  final IconData icon;
  bool isMainPage;

  LinkedinAppBar({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isMainPage = true,
  }) : super(key: key);

  @override
  State<LinkedinAppBar> createState() => _LinkedinAppBarState();
}

class _LinkedinAppBarState extends State<LinkedinAppBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isMainPage
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/profile1.jpg",
                            ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Icon(Icons.arrow_back,
                color: Color(0xFF565b5f),
                size: 35,
              ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFFeef3f7),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF565b5f),
                ),
              ),
            ),
          ),
          Icon(
            widget.icon,
            color: Color(0xFF696969),
            size: 25,
          ),
        ],
      ),
    );
  }
}
