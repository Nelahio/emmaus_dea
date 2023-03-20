import 'package:emmaus_dea/pages/page_declaration.dart';
import 'package:emmaus_dea/pages/page_livraison.dart';
import 'package:emmaus_dea/pages/page_ramasse.dart';
import 'package:emmaus_dea/pages/page_statistiques.dart';
import 'package:emmaus_dea/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';

import '../class/colors_app.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedIndex = 0;
  List<Widget> _widgets = <Widget>[
    PageDeclaration(),
    PageLivraison(),
    PageRamasse(),
    PageStatistiques(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: HomeAppBar(),
      body: _widgets.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: "Déclarations",
            tooltip: "Déclarations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_rounded),
            label: "Livraisons",
            tooltip: "Livraisons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_rounded),
            label: "Ramasses",
            tooltip: "Ramasses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            label: "Statistiques",
            tooltip: "Statistiques",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsApp.Blue_Color,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: ,
      ),
    );
  }
}
