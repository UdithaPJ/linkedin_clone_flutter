import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/core/utils/constants.dart';
import 'package:linkedin_clone_flutter/ui/widgets/customButton.dart';
import 'package:linkedin_clone_flutter/ui/widgets/linkedinAppBar.dart';
import 'package:provider/provider.dart';
import '../../config/app_routes.dart';
import '../../core/models/post_model.dart';
import '../../core/models/user_model.dart';
import '../../viewmodels/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBottomNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchPosts(context);
    });
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
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
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
    return Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if(viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if(viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text(viewModel.errorMessage));
          }

          return Container(
            color: Colors.black12,
            child: Column(
              children: [
                _showBottomNavBar ? LinkedinAppBar(
                    hintText: "Search",
                    icon: FontAwesomeIcons.solidCommentDots,
                    onTap: () {
                    Navigator.pushNamed(context, AppRoutes.profile);
                  },
                ) :
                Container(
                  height: 0,
                  width: 0,
                ),
                _postListWidget(viewModel),
              ],
            ),
          );
        }
    );
  }

  Widget _postListWidget(HomeViewModel viewModel) {
    return Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.
          builder(
            controller: _scrollController,
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              PostWithUserData postWithUserData = viewModel.posts[index];
              print(viewModel.posts.length);
              return _postItem(postWithUserData);
            },
        ),),
    );
  }

  Widget _postItem(PostWithUserData postWithUserData) {
    PostModel post = postWithUserData.post;
    UserModel user = postWithUserData.user;

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
                    image: AssetImage(
                      user.profileImageUrl ?? "assets/default-profile.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child:
                    user.headline != null ?
                      Text(
                        user.headline!,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ): null,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            post.description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child:
            post.tags != null ?
              Text(
                post.tags!,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                ),
              ): null,
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
              post.imageUrl != null ?
              Image.asset(
                post.imageUrl!,
                fit: BoxFit.contain,
              ): null,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              post.likes != null ?
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
                      Text(
                        '${post.likes}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ):
                SizedBox(),
              post.comments != null ?
                Container(
                  child: Row(
                    children: [
                      Text(
                        '${post.comments}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 4),
                      Text("comments",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ):
                SizedBox(),
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
  }

  Widget _rowButtons() {
    return Material(
      child: Container(
        color: Colors.white,
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
      ),
    );
  }
}
