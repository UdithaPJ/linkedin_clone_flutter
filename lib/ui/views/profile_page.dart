import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/core/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../widgets/linkedinAppBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              if(authViewModel.isLoading) {
                return CircularProgressIndicator();
              }
              else {
                return Container(
                  color: Colors.black12,
                  child: Column(
                    children: [
                      SafeArea(child: LinkedinAppBar(
                          hintText: authViewModel.user?.name ?? '--',
                          icon: FontAwesomeIcons.cog, isMainPage: false,
                          onTap: () => Navigator.pop(context),
                      ),
                  
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  child:
                                    Image.asset(
                                      authViewModel.user?.bannerImageUrl ?? 'assets/default-banner.png',
                                      fit: BoxFit.contain,
                                    ),
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  padding: EdgeInsets.only(top: 80, left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        authViewModel.user?.name ?? '--',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        authViewModel.user?.headline ?? '--',
                                        style: TextStyle(
                                          color: Colors.grey,),
                                      ),
                                      Text(
                                        authViewModel.user?.bio ?? '--',
                                        style: TextStyle(
                                          color: Colors.grey,),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        authViewModel.user?.location ?? '--',
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          authViewModel.user?.noOfFollowers != null ?
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                '${authViewModel.user!.noOfFollowers} followers',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ):
                                            SizedBox(width: 10),
                                          SizedBox(width: 10),
                                          authViewModel.user?.noOfConnections != null ?
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                '${authViewModel.user!.noOfConnections} connections',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ):
                                            SizedBox(width: 10),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40, vertical: 0)),
                                              backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
                                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                  side: BorderSide(color: Color(0xFF414141)),
                                                ),
                                              ),
                                            ),
                                            child: Text("Open to",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40, vertical: 0)),
                                              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                  side: BorderSide(color: Color(0xFF414141)),
                                                ),
                                              ),
                                            ),
                                            child: Text("Add section",
                                              style: TextStyle(
                                                color: Color(0xFF414141),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                                              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                              shape: WidgetStateProperty.all<CircleBorder>(
                                                CircleBorder(
                                                  side: BorderSide(color: Color(0xFF414141)),
                                                ),
                                              ),
                                            ),
                                            child: Text("...",
                                              style: TextStyle(
                                                color: Color(0xFF414141),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.1 - 20,
                              left: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black26, blurRadius: 10),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage(
                                            authViewModel.user?.profileImageUrl ?? 'assets/default-profile.png',
                                          ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: FloatingActionButton(
                                        heroTag: 'add_profile',
                                        shape: CircleBorder(),
                                        backgroundColor: Colors.white,
                                        mini: true,
                                        onPressed: () {},
                                        child: Icon(Icons.add,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: FloatingActionButton(
                                heroTag: 'add_banner',
                                backgroundColor: Colors.white,
                                mini: true,
                                onPressed: () {},
                                child: Icon(Icons.camera_alt_outlined,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 140,
                              right: 10,
                              child: FloatingActionButton(
                                heroTag: 'edit_info',
                                backgroundColor: Colors.white,
                                mini: true,
                                onPressed: () {},
                                child: Icon(Icons.edit,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Analytics",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.visibility,
                                    color: Colors.black26,
                                  ),
                                  SizedBox(width: 5),
                                  Text("Private for you",
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.group_rounded,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${authViewModel.user?.noOfProfileViews ?? 0} profile views',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Discover who's viewed your profile",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Colors.black26,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.bar_chart_sharp,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${authViewModel.user?.noOfImpressions ?? 0} post impressions',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text("Start a post to increase engagement",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text("Past 7 days",
                                              style: TextStyle(
                                                color: Colors.black26,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ), // Added some text for demonstration
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Colors.black26,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Text("Show all activity",
                                            style: TextStyle(
                                              color: Color(0xFF666666),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(Icons.arrow_forward,
                                          color: Color(0xFF666666),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Education",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                authViewModel.user?.education ?? '--',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Skills",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                authViewModel.user?.skills?.isNotEmpty == true
                                    ? authViewModel.user!.skills!.join(', ')
                                    : '--',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("People you may know",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              _userListWidget(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text("Show all",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.arrow_forward,
                                    color: Color(0xFF666666),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }

        ),
      ),
    );
  }

  Widget _userListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alice Johnson",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Product Manager at InnovateInc",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Color(0xFF414141)),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_add_alt_rounded,
                              color: Color(0xFF414141),
                            ),
                            SizedBox(width: 5),
                            Text("Connect",
                              style: TextStyle(
                                color: Color(0xFF414141),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // Added some text for demonstration
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
            ],
          ),
        );
      },
    );
  }
}






