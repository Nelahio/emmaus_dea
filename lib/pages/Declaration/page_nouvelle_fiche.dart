import 'package:emmaus_dea/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';

class PageNouvelleFiche extends StatefulWidget {
  const PageNouvelleFiche({Key? key}) : super(key: key);

  @override
  State<PageNouvelleFiche> createState() => _PageNouvelleFicheState();
}

class _PageNouvelleFicheState extends State<PageNouvelleFiche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView(
        children: [],
      ),
    );
  }
}
