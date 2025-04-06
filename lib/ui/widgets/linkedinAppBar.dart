import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/config/app_routes.dart';
import 'package:linkedin_clone_flutter/ui/views/login_page.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';

class LinkedinAppBar extends StatefulWidget {
  final String hintText;
  final IconData icon;
  bool isMainPage;
  final VoidCallback onTap;

  LinkedinAppBar({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isMainPage = true,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LinkedinAppBar> createState() => _LinkedinAppBarState();
}

class _LinkedinAppBarState extends State<LinkedinAppBar> {


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
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
                      child: GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 5),
                            ],
                            image: DecorationImage(
                              image:
                              authViewModel.user?.profileImageUrl != null ?
                              AssetImage(
                                authViewModel.user!.profileImageUrl!,
                              ) :
                              AssetImage(
                                'assets/default-profile.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : GestureDetector(
                        onTap: widget.onTap,
                        child: Icon(
                          Icons.arrow_back,
                            color: Color(0xFF565b5f),
                            size: 35,
                          ),
                ),
                Material(
                  child: Container(
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
                ),
                PopupMenuButton(
                  surfaceTintColor: Colors.white,
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white),
                  ),
                  icon: Icon(
                    widget.icon,
                    color: Color(0xFF696969),
                    size: 25,
                  ),
                  onSelected: (int value) async {
                    try {
                      await authViewModel.signOut(context);
                      Navigator.pushNamed(context, AppRoutes.login);
                    } catch (e) {
                      throw Exception('Something went wrong: $e');
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    
    );
  }
}
