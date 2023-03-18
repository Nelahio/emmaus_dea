import 'package:emmaus_dea/class/colors_app.dart';
import 'package:flutter/material.dart';

class CardFiche extends StatefulWidget {
  const CardFiche({Key? key}) : super(key: key);

  @override
  State<CardFiche> createState() => _CardFicheState();
}

class _CardFicheState extends State<CardFiche> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //   // image: AssetImage("images/${widget.image}"),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          ListTile(
            tileColor: ColorsApp.Blue_Color,
            textColor: Colors.white,
            title: Text('Bon App'),
            subtitle: Row(
              children: [
                Icon(Icons.access_time_rounded),
                Text("17h30 "),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.delivery_dining_rounded),
                Text("1,90€"),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.shopping_bag_rounded),
                Text("Min 20€")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
