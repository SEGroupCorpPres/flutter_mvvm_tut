import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tut/res/components/main_button.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_tut/utils/utils.dart';
import 'package:flutter_mvvm_tut/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _obscurePassword.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sign Up'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                focusNode: emailFocus,
                onSubmitted: (value) {
                  Utils.fieldFocusChange(
                    context,
                    emailFocus,
                    passwordFocus,
                  );
                },
                suffix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_outlined),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.tertiarySystemFill,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return CupertinoTextField(
                    controller: _passwordController,
                    placeholder: 'Password',
                    obscureText: _obscurePassword.value,
                    focusNode: passwordFocus,
                    suffix: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CupertinoButton(
                        minSize: 15,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(
                          _obscurePassword.value ? CupertinoIcons.lock : CupertinoIcons.lock_open,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.tertiarySystemFill,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              MainButton(
                title: 'Sign Up',
                loading: authViewModel.signUpLoading,
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(context, 'Please enter a email');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(context, 'Please enter a password');
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(context, 'Please enter 6 digit password');
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.signUpApi(context, data);
                  }
                },
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, RoutesName.login),
                child: const Text('Already have an account ?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
