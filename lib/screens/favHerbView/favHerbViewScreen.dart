import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/screens/viewFav/viewFavScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class FavView extends StatelessWidget {
  Herb herb;
  FavView(this.herb);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/herbview.png'),
                  fit: BoxFit.cover)),
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#A0C391'),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.w),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(MaterialPageRoute(builder: (context) {
                          return ViewFav();
                        }));
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15.w,
                    ),
                    child: Text(
                      herb.name,
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20.w,
                    ),
                    child: Text(
                      'INGREDIENTS',
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 20.w,
                      left: 38.w,
                    ),
                    child: Text(
                      herb.ingrediants,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20.w,
                    ),
                    child: Text(
                      'PREPARATION',
                      style: TextStyle(
                          color: HexColor('#A0C391'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 20.w,
                      left: 38.w,
                      bottom: 20.w,
                    ),
                    child: Text(
                      herb.prepation,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/box.png'),
                      fit: BoxFit.cover))),
        ),
      ),
    );
  }
}
