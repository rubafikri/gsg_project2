import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/shardrdHelper.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (SpHelper.spHelper.getValue()) {
        Navigator.of(context).pushReplacementNamed('home');
      } else {
        Navigator.of(context).pushReplacementNamed('login');
      }
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.w),
        child: Center(
          child: Container(
              width: 1000.sw,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/photo.png'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'welcome to',
                        style: TextStyle(
                          color: HexColor('#6E8F60'),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/logo.png')),
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 50),
                      child: Text(
                        'THE HUB FOR ALL YOUR SPICES',
                        style: TextStyle(
                          color: HexColor('#6E8F60'),
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/stamp.png')),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
