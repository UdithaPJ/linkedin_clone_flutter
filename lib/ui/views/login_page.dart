import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_clone_flutter/core/utils/constants.dart';
import 'package:linkedin_clone_flutter/core/utils/validators.dart';
import 'package:linkedin_clone_flutter/ui/views/forgotpassword_page.dart';
import 'package:linkedin_clone_flutter/ui/views/main_page.dart';
import 'package:linkedin_clone_flutter/ui/views/profile_page.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page.dart';
import 'package:linkedin_clone_flutter/ui/views/home_page.dart';
import 'package:linkedin_clone_flutter/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isMarkedRemember = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 30),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("or",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),),);
                              },
                              child: Text("Join LinkedIn",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
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
                              SvgPicture.asset("assets/icons-google.svg",
                                width: 23,
                                height: 23,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
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
                              SvgPicture.asset("assets/apple-logo.svg",
                                width: 23,
                                height: 23,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Sign in with Apple",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
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
                              SvgPicture.asset("assets/facebook-logo.svg",
                                width: 23,
                                height: 23,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Sign in with Facebook",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              obscureText: true,
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
                                            color: kPrimaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotpasswordPage(),),);
                              },
                              child: Text("Forgot password?",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if(_formKey.currentState!.validate()) {
                                    try {
                                      await authViewModel.signIn(_emailController.text.trim(), _passwordController.text.trim());
                                      print('Logged in successfully!');
                                      print(authViewModel.user);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),),);
                                      if(authViewModel.user != null) {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                                      }
                                    } catch (e) {
                                      throw Exception('Authentication error login: $e');
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
