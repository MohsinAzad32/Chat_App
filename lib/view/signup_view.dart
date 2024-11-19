import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:mvvm/utils/routes/routes_names.dart';
// import 'package:mvvm/utils/utils.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailcontroller = TextEditingController();
  final paswordcontroller = TextEditingController();
  final ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  final emailnode = FocusNode();
  final passwordnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: emailnode,
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.alternate_email,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.shiftfocus(node: passwordnode, context: context);
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurepassword,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: _obsecurepassword.value,
                      focusNode: passwordnode,
                      controller: paswordcontroller,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurepassword.value = !_obsecurepassword.value;
                          },
                          child: Icon(
                            _obsecurepassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 * 0.085,
              ),
              RoundButton(
                loading: authmodel.signuploading,
                onpressed: () {
                  if (emailcontroller.text.isEmpty) {
                    Utils.showflushbar('Please Enter Email', context);
                  } else if (paswordcontroller.text.isEmpty) {
                    Utils.showflushbar('Please Enter Password', context);
                  } else if (paswordcontroller.text.length < 6) {
                    Utils.showflushbar(
                        'Enter Password of 6 characters', context);
                  } else {
                    Map data = {
                      'email': emailcontroller.text,
                      'password': paswordcontroller.text,
                    };
                    authmodel.register(data, context);
                    print('Api hit');
                  }
                },
                title: 'Signup',
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routesname.login);
                },
                child: const Text(
                  'Already have account? Login',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        )));
  }
}
