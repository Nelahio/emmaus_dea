import 'package:emmaus_dea/class/colors_app.dart';
import 'package:emmaus_dea/widgets/Declaration/CardDeclaration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:mysql_client/mysql_client.dart';

class PageDeclaration extends StatelessWidget {
  const PageDeclaration({Key? key}) : super(key: key);

  Future<void> _query() async {
    await dotenv.load();
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: dotenv.env['DB_HOST']!,
      port: int.parse(dotenv.env['DB_PORT']!),
      userName: dotenv.env['DB_USER']!,
      password: dotenv.env['DB_PASSWORD']!,
      databaseName: dotenv.env['DB_DATABASE']!, // optional
    );

    await conn.connect();

    print("Connected");

    // make query
    var result = await conn.execute("SELECT * FROM meuble");

    // print some result data
    print(result.numOfColumns);
    print(result.numOfRows);
    print(result.lastInsertID);
    print(result.affectedRows);

    // print query result
    for (final row in result.rows) {
      // print(row.colAt(0));
      // print(row.colByName("title"));

      // print all rows as Map<String, String>
      print(row.assoc());
    }

    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return CardDeclaration();
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: ColorsApp.Blue_Color,
        child: Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: 75,
        expandedFabSize: ExpandableFabSize.regular,
        closeButtonStyle: ExpandableFabCloseButtonStyle(
          backgroundColor: ColorsApp.Blue_Color,
        ),
        children: [
          FloatingActionButton.extended(
            backgroundColor: ColorsApp.Blue_Color,
            icon: const Icon(Icons.add_card_rounded),
            label: Text("Fiche"),
            onPressed: () async {
              if (kDebugMode) {
                await _query();
                print("Fiche");
              }
            },
          ),
          FloatingActionButton.extended(
            backgroundColor: ColorsApp.Blue_Color,
            icon: const Icon(Icons.add_chart_rounded),
            onPressed: () {
              if (kDebugMode) {
                print("Déclaration");
              }
            },
            label: Text("Déclaration"),
          ),
        ],
      ),
    );
  }
}
