import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/screens/Home/homeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HerbView extends StatefulWidget {
  Herb herb;
  HerbView(this.herb);

  @override
  _HerbViewState createState() => _HerbViewState();
}

class _HerbViewState extends State<HerbView> {
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(MaterialPageRoute(builder: (context) {
                          return Home();
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
                      widget.herb.name,
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
                      widget.herb.ingrediants,
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
                      widget.herb.prepation,
                      style: TextStyle(
                          color: HexColor('#6C7B6B'),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 60.w,
                    ),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.favorite,
                        color: widget.herb.isFav ? Colors.red : Colors.white,
                      ),
                      label: Text(
                        'ADD TO FAVORITES ',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#A0C391'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      onPressed: () {
                        setState(() {});
                        widget.herb.isFav = true;
                      },
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
