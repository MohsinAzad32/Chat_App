import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:mvvm/utils/routes/routes_names.dart';
// import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailcontroller = TextEditingController();
  final paswordcontroller = TextEditingController();
  final ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  final emailnode = FocusNode();
  final passwordnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authmodel = Provider.of<AuthViewModel>(context);
    final usermodel = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                usermodel.loginfalse();
              },
              icon: const Icon(
                Icons.exit_to_app,
              ),
            ),
          ],
          title: const Text('Login'),
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
                loading: authmodel.loading,
                onpressed: () {
                  if (emailcontroller.text.isEmpty) {
                    Utils.showflushbar('Please Enter Email', context);
                  } else if (paswordcontroller.text.isEmpty) {
                    Utils.showflushbar('Please Enter Password', context);
                  } else if (paswordcontroller.text.length < 6) {
                    Utils.showflushbar(
                        'Enter Password of 6 characters', context);
                  } else {
                    usermodel.logintrue();
                    Map data = {
                      'email': emailcontroller.text,
                      'password': paswordcontroller.text,
                    };
                    authmodel.login(data, context);
                    print('Api hit');
                  }
                },
                title: 'Login',
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routesname.singup);
                },
                child: const Text(
                  'Dont have account? Signup',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        )));
  }
}
