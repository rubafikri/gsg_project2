import 'package:flutter/material.dart';
import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:flutter_gsg_project2/screens/editHerb/editHerb.dart';
import 'package:flutter_gsg_project2/screens/viewHerb/viewHerb.dart';

import 'package:hexcolor/hexcolor.dart';

class HerbItemList extends StatelessWidget {
  Herb herb;
  Function updating;
  Function removing;

  removeHerb(String id) async {
    // await FirstoreHelper.firstoreHelper.deleteHerb(id);
  }

  HerbItemList(this.herb, this.updating, this.removing);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: HexColor('#068F6E'))),
        child: Column(
          children: [
            ListTile(
              title: ListTile(
                title: Container(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    alignment: Alignment.center,
                    child: Text(herb.name)),
                subtitle: Container(
                  alignment: Alignment.center,
                  child: Text(herb.shortDiscription),
                ),
              ),

              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HerbView(herb);
                        }));
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: HexColor('#068F6E'),
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return EditHerb(herb);
                        }));
                      },
                      icon: Icon(Icons.edit, color: HexColor('#068F6E'))),
                  IconButton(
                      onPressed: () {
                        removing(herb.id);
                      },
                      icon: Icon(Icons.delete, color: HexColor('#068F6E'))),
                ],
              ),

              // title: Text(task.title),
            ),
          ],
        ));
  }
}
