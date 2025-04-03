import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:provider/provider.dart';

import '../../core/utils/constants.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage3 extends StatefulWidget {
  const SignupPage3({super.key});

  @override
  State<SignupPage3> createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  bool _isMarkedRemember = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                      Text("Set your password",
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
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password*",
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: Color(0xFF006a43),
                            value: _isMarkedRemember, onChanged: (value) {
                            setState(() {
                              _isMarkedRemember = value!;
                            });
                          },
                          ),
                          Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Remembre me. ",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Learn more",
                                    style: TextStyle(
                                      color: Color(0xFF2b5c94),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            final signupData = signupViewModel.signupData;
                            print(signupData);
                            await authViewModel.signUp(signupData.fullName, signupData.email, _passwordController.text.trim());
                            print('Signed Up!');
                            print(authViewModel.user?.uid);
                            print(authViewModel.user?.name);
                            print(authViewModel.user?.email);
                            if(authViewModel.user != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                            }
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