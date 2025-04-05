import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/validators.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage3 extends StatefulWidget {
  const SignupPage3({super.key});

  @override
  State<SignupPage3> createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  final _formKey = GlobalKey<FormState>();
  bool _isMarkedRemember = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isFilledEmail = false;

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
                      // LinearProgressIndicator(
                      //   value: 0.1,
                      //   semanticsLabel: 'Linear progress indicator',
                      //   backgroundColor: Colors.white,
                      //   color: Colors.green,
                      // ),
                      SizedBox(
                        child: LinearProgressIndicator(
                          
                          value: 0.1,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                        ),
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
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: "Email or Phone*",
                                ),
                                validator: (value) => Validators.validateEmail(value),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: "Password*",
                                ),
                                validator: (value) => Validators.validatePassword(value),
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
                                    if(_formKey.currentState!.validate()) {
                                      final signupData = signupViewModel.signupData;
                                      await authViewModel.signUp(signupData.fullName, signupData.email, _passwordController.text.trim(), _isMarkedRemember);
                                      if(authViewModel.user != null) {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                                      }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}