import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/shardrdHelper.dart';
import 'package:flutter_gsg_project2/screens/Home/homeScreen.dart';
import 'package:flutter_gsg_project2/screens/addHerb/addHerbScreen.dart';
import 'package:flutter_gsg_project2/screens/editHerb/editHerb.dart';
import 'package:flutter_gsg_project2/screens/favHerbView/favHerbViewScreen.dart';
import 'package:flutter_gsg_project2/screens/login/loginScreen.dart';
import 'package:flutter_gsg_project2/screens/register/registerScreen.dart';
import 'package:flutter_gsg_project2/screens/splash/splachScreen.dart';
import 'package:flutter_gsg_project2/screens/viewFav/viewFavScreen.dart';
import 'package:flutter_gsg_project2/screens/viewHerb/viewHerb.dart';

import 'helpers/databaseHelper.dart';
import 'models/herb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  await SpHelper.spHelper.initSharedPrefernces();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        'home': (context) => Home(),
        'login': (context) => Login(),
        'register': (context) => SignUp(),
        'addHerb': (context) => AddHerb(),
        'editHerb': (context) => EditHerb(Herb()),
        'favView': (context) => FavView(Herb()),
        'viewFav': (context) => ViewFav(),
        'viewHerb': (context) => HerbView(Herb())
      },
    );
  }
}
