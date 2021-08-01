import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/databaseHelper.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/screens/addHerb/addHerbScreen.dart';
import 'package:flutter_gsg_project2/screens/viewFav/viewFavScreen.dart';
import 'package:flutter_gsg_project2/widgets/herbItelist.dart';

import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Herb> herbs;

  updateTask(Herb herb) async {
    await DbHelper.dbHelper.updateTask(herb);
    getAllHerbs();
  }

  removeHerb(int id) async {
    await DbHelper.dbHelper.deleteTask(id);
    getAllHerbs();
  }

  getAllHerbs() async {
    herbs = await DbHelper.dbHelper.getAllHerb();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllHerbs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: HexColor('#6E8F60'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ViewFav(herbs: herbs);
                  }));
                },
                icon: Icon(Icons.favorite)),
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('addHerb');
                herbs.forEach((element) {
                  print(element.name);
                });
                print(herbs.toList());
              },
              icon: Icon(Icons.add)),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
            child: herbs == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: herbs.length,
                    itemBuilder: (context, index) {
                      return HerbItemList(herbs[index], updateTask, removeHerb);
                    })),
      ),
    );
  }
}
