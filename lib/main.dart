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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
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
      ),
    );
  }
}
