import 'package:flutter/material.dart';

class PageStatistiques extends StatefulWidget {
  const PageStatistiques({Key? key}) : super(key: key);

  @override
  State<PageStatistiques> createState() => _PageStatistiquesState();
}

class _PageStatistiquesState extends State<PageStatistiques>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
        bottom: TabBar(
          // indicatorSize: ,
          controller: _tabController,
          automaticIndicatorColorAdjustment: true,
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
              text: "Apports volontaires",
            ),
            Tab(
              icon: Icon(Icons.fire_truck_rounded),
              text: "Collectes à domicile",
            ),
            Tab(
              icon: Icon(Icons.monetization_on_rounded),
              text: "Réemploi",
            ),
            Tab(
              icon: Icon(Icons.shopping_basket_rounded),
              text: "Stock magasin",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}
