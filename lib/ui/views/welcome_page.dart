import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/core/utils/constants.dart';
import '../../config/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/logo.svg",
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Join a trusted community of 1B\n professionals",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Padding(padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 55,
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),),);
                    //       },
                    //     style: ButtonStyle(
                    //       backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
                    //       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(25),
                    //           side: BorderSide(color: kPrimaryColor),
                    //         ),
                    //       ),
                    //     ),
                    //     child: Text("Agree & Join",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons-google.svg",
                              width: 23,
                              height: 23,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SvgPicture.asset("assets/facebook-logo.svg",
                            //   width: 23,
                            //   height: 23,
                            // ),
                            FaIcon(FontAwesomeIcons.envelope,
                              color: Color(0xFF4c4c4c),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Sign in with Email",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Divider(
                              indent: 1.0,
                              endIndent: 20.0,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                              color: Color(0xFF2f2f2f),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              indent: 20.0,
                              endIndent: 1.0,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to LinkedIn?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signup1);
                    },
                    child: Text("Join now",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By clicking Agree & Join ot Continue, you agree to the LinkedIn ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'User Agreement',
                      style: TextStyle(
                        color: Color(0xFF2b5c94),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ', ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF2b5c94),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ', and ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Cookie Policy',
                      style: TextStyle(
                        color: Color(0xFF2b5c94),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
