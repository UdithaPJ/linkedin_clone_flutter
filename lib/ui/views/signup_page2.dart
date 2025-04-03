import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page3.dart';
import 'package:provider/provider.dart';

import '../../core/utils/constants.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage2 extends StatelessWidget {
  SignupPage2({super.key});
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset("assets/logo.svg",
                    width: 35,
                    height: 35,
                  ),
                ),
                SizedBox(height: 40),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value: 0.1,
                        semanticsLabel: 'Linear progress indicator',
                        backgroundColor: Colors.white,
                        color: Colors.green,
                      ),
                      SizedBox(height: 50),
                      Text("Add your email or phone",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email or Phone*",
                        ),
                      ),
                      SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            final signupData = signupViewModel.signupData;
                            signupViewModel.updateEmail(_emailController.text.trim());
                            print(signupData.fullName);
                            print(signupData.email);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage3(),),);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: kPrimaryColor),
                              ),
                            ),
                          ),
                          child: Text("Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}