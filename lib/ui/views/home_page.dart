import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/core/utils/constants.dart';
import 'package:linkedin_clone_flutter/ui/widgets/customButton.dart';
import 'package:linkedin_clone_flutter/ui/widgets/linkedinAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final _post = Data.postList;
  bool _showBottomNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() async {
    _scrollController.addListener((){
      if(_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if(!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if(_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if(_isScrollDown) {
          _isScrollDown = false;
          _showAppNavBar();
          setState(() {

          });
        }
      }
    });
  }

  void _hideAppNavBar() {
    setState(() {
      _showBottomNavBar = false;
    });
  }

  void _showAppNavBar() {
    setState(() {
      _showBottomNavBar = true;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        children: [
          _showBottomNavBar ? LinkedinAppBar(hintText: "Search", icon: FontAwesomeIcons.solidCommentDots) :
              Container(
                height: 0,
                width: 0,
              ),
          _postListWidget(),
        ],
      ),
    );
  }

  Widget _postListWidget() {
    return Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.
          builder(
            controller: _scrollController,
            //itemCount: post.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: EdgeInsets.only(bottom: 0, top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black54, width: 0.5),
                    bottom: BorderSide(color: Colors.black54, width: 0.5),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/profile2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("username",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Text("headline",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("This type of button is commonly found in applications like project management tools (e.g., monday.com, Stackby), spreadsheets, or",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("#tags#tags#tags#tags#tags#tags",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/example-post-image.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset("assets/like-icon.png"),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset("assets/celebrate-icon.png"),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset("assets/love-icon.png"),
                              ),
                              SizedBox(width: 5),
                              Text("237",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text("102",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(width: 4),
                              Text("comments",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black26,
                    ),
                    _rowButtons(),
                  ],
                ),
              );
            },
        ),),
    );
  }

  Widget _rowButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: CustomButton(
                name: "Like",
                iconImage: "assets/like.png",
                color: Color(0xFF666666)
            ),
          ),
          InkWell(
            onTap: () {},
            child: CustomButton(
                name: "Comment",
                iconImage: "assets/comment.png",
                color: Color(0xFF666666)
            ),
          ),
          InkWell(
            onTap: () {},
            child: CustomButton(
                name: "Repost",
                iconImage: "assets/repost.png",
                color: Color(0xFF666666)
            ),
          ),
          InkWell(
            onTap: () {},
            child: CustomButton(
                name: "Send",
                iconImage: "assets/send.png",
                color: Color(0xFF666666)
            ),
          ),
        ],
      ),
    );
  }
}
