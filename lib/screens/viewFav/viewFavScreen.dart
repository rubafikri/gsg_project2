import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/helpers/databaseHelper.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/widgets/favourite.dart';
import 'package:hexcolor/hexcolor.dart';

class ViewFav extends StatefulWidget {
  List<Herb> herbs;
  ViewFav({this.herbs});

  @override
  _ViewFavState createState() => _ViewFavState();
}

class _ViewFavState extends State<ViewFav> {
  getAllHerbs() async {
    widget.herbs = await DbHelper.dbHelper.getAllHerb();
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
          title: Text('FAVORITE HERBS RECIPES'),
          backgroundColor: HexColor('#6E8F60'),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15)),
            child: widget.herbs == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        widget.herbs.where((element) => element.isFav).length,
                    itemBuilder: (context, index) {
                      return Favourite(
                        widget.herbs
                            .where((element) => element.isFav)
                            .toList()[index],
                      );
                    })),
      ),
    );
  }
}
