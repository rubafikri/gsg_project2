import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/shardrdHelper.dart';
import 'package:flutter_gsg_project2/screens/Home/homeScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool visiblbool = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 60),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Container(
                width: 132.sw,
                height: 132.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Rigester',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27.sp,
                  color: HexColor('#068F6E'),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              controller: emailcontroller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              obscureText: visiblbool,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              controller: passwordcontroller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      visiblbool ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        visiblbool = !visiblbool;
                      });
                    }),
                hintStyle: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: Center(
              child: InkWell(
                onTap: () {
                  if (emailcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Your Email',
                    );
                  }
                  if (!isEmail(emailcontroller.text)) {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Valid Email',
                    );
                  } else if (passwordcontroller.text == '') {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Please Enter Your password',
                    );
                  } else if (passwordcontroller.text.length < 6) {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'Your password Must be larger than 6 char',
                    );
                  } else {
                    SpHelper.spHelper.setIsLogged();

                    Navigator.of(context).pushReplacementNamed('home');
                  }
                },
                child: Container(
                  width: 161.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#068F6E'), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#068F6E')),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
