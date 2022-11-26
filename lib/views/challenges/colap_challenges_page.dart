import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size sizeinput = MediaQuery
        .of(context)
        .size;
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _logInKey,
            child: SizedBox(
              width: widget.size.width,
              height: widget.defaultLoginSize,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Login or Sign up",

                    ),
                    Text(
                      "Login so you can care your pets easily.",

                    ),
                    const SizedBox(
                      height: 50,
                    ),

                  ]),
            ),
          ),
        ),
      ),
    );
  }
}