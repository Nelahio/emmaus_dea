import 'package:emmaus_dea/class/colors_app.dart';
import 'package:flutter/material.dart';

class CardFiche extends StatefulWidget {
  final String provenance;
  const CardFiche({Key? key, required this.provenance}) : super(key: key);

  @override
  State<CardFiche> createState() => _CardFicheState();
}

Color getColor(String provenance) {
  if (provenance == "Apport volontaire") {
    return ColorsApp.Apport_Color;
  } else if (provenance == "Collecte à domicile") {
    return ColorsApp.Collecte_Color;
  } else if (provenance == "Réemploi") {
    return ColorsApp.Reemploi_Color;
  } else {
    return ColorsApp.Blue_Color;
  }
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
          ListTile(
            onTap: () {
              final snackBar = SnackBar(
                elevation: 5,
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorsApp.Blue_Color,
                content: const Text('Yay! A SnackBar!'),
                shape: RoundedRectangleBorder(
                  // side: BorderSide(color: ColorsApp.Yellow_Color, width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              print("page détail fiche");
            },
            isThreeLine: true,
            tileColor: getColor(widget.provenance),
            textColor: Colors.white,
            title: Text(
              widget.provenance,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Icons.access_time_rounded),
                Text(
                  "19/03/2023",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                // Icon(Icons.delivery_dining_rounded,
                //     color: ColorsApp.Yellow_Color),
                Text("5 meubles"),
                SizedBox(
                  height: 5,
                ),
                // Icon(Icons.shopping_bag_rounded),
                Text("300 kg")
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    IconData(0xe21a, fontFamily: 'MaterialIcons'),
                    size: 20.0,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {
                    //   _onDeleteItemPressed(index);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20.0,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {
                    //   _onDeleteItemPressed(index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
