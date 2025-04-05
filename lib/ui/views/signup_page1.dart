import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedin_clone_flutter/ui/views/signup_page2.dart';
import 'package:provider/provider.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/validators.dart';
import '../../viewmodels/signup_viewmodel.dart';

class SignupPage1 extends StatelessWidget {
  SignupPage1({super.key});
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

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
                        Text("Add your name",
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
                                  controller: _firstnameController,
                                  decoration: InputDecoration(
                                    labelText: "First name*",
                                  ),
                                  validator: (value) => Validators.validateEmptyField('First name', value),
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: _lastnameController,
                                  decoration: InputDecoration(
                                    labelText: "Last name*",
                                  ),
                                  validator: (value) => Validators.validateEmptyField('Last name', value),
                                ),
                                SizedBox(height: 35),
                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()) {
                                        final signupData = signupViewModel.signupData;
                                        signupViewModel.updateName(_firstnameController.text.trim(), _lastnameController.text.trim());
                                        print(signupData.fullName);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage2(),),);
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
