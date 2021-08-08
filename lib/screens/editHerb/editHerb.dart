import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/databaseHelper.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hexcolor/hexcolor.dart';

class EditHerb extends StatefulWidget {
  Herb herb;

  EditHerb(this.herb);

  @override
  _EditHerbState createState() => _EditHerbState();
}

class _EditHerbState extends State<EditHerb> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController shortDesccontroller = TextEditingController();

  TextEditingController ingrdiatecontroller = TextEditingController();

  TextEditingController prprationcontroller = TextEditingController();

  TextEditingController idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        backgroundColor: HexColor('#6E8F60'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.name,
              onChanged: (value) {
                widget.herb.name = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.shortDiscription,
              onChanged: (value) {
                widget.herb.shortDiscription = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.ingrediants,
              onChanged: (value) {
                widget.herb.ingrediants = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 6,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.herb.prepation,
              onChanged: (value) {
                widget.herb.prepation = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text(
                'EDIT ',
                style: TextStyle(fontSize: 20.sp),
              ),
              style: ElevatedButton.styleFrom(
                primary: HexColor('#C2DEAE'),
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.w),
              ),
              onPressed: () {
                print(widget.herb.toMap());
                DbHelper.dbHelper.updateTask(widget.herb);

                Navigator.of(context).pushReplacementNamed('home');
              },
            ),
          ),
        ],
      ),
    ));
  }
}
