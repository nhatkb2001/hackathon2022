import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
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
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _conformPwd = TextEditingController();


  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size sizeinput = MediaQuery
        .of(context)
        .size;
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: SizedBox(
                width: widget.size.width,
                height: widget.defaultLoginSize,
                child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to Petcare",

                      ),
                      Container(
                        width: 300,
                        height: 250,
                        alignment: Alignment.topCenter,

                      ),


                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}