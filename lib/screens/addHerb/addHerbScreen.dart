import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/databaseHelper.dart';
import 'package:flutter_gsg_project2/helpers/shardrdHelper.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/screens/Home/homeScreen.dart';
import 'package:flutter_gsg_project2/widgets/textformfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddHerb extends StatefulWidget {
  @override
  _AddHerbState createState() => _AddHerbState();
}

class _AddHerbState extends State<AddHerb> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController shortDesccontroller = TextEditingController();
  TextEditingController ingrdiatecontroller = TextEditingController();
  TextEditingController prprationcontroller = TextEditingController();

  var uid = Uuid();

  bool visiblbool = true;
  GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
        backgroundColor: HexColor('#6E8F60'),
        centerTitle: true,
      ),
      body: Form(
        key: form,
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            TextFormStyle(
              hintText: 'Name',
              editingController: namecontroller,
              lines: 1,
            ),
            TextFormStyle(
              hintText: 'Short Description',
              editingController: shortDesccontroller,
              lines: 2,
            ),
            TextFormStyle(
              hintText: 'INGREDIENTS',
              editingController: ingrdiatecontroller,
              lines: 6,
            ),
            TextFormStyle(
              hintText: 'PREPARATION',
              editingController: prprationcontroller,
              lines: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text(
                  'ADD NEW ',
                  style: TextStyle(fontSize: 20.sp),
                ),
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#C2DEAE'),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5.w),
                ),
                onPressed: () {
                  if (form.currentState.validate()) {
                    form.currentState.save();
                    String name = namecontroller.text;
                    String ingre = ingrdiatecontroller.text;
                    String short = shortDesccontroller.text;
                    String pre = prprationcontroller.text;
                    DbHelper.dbHelper.insertHerb(Herb(
                        name: name,
                        ingrediants: ingre,
                        shortDiscription: short,
                        prepation: pre));
                    print('added');
                    Navigator.of(context).pushReplacementNamed('home');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
