import 'package:emmaus_dea/widgets/Declaration/ExpandableFabDeclaration.dart';
import 'package:emmaus_dea/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';

class PageFiches extends StatefulWidget {
  final String provenance;
  const PageFiches({Key? key, required this.provenance}) : super(key: key);

  @override
  State<PageFiches> createState() => _PageFichesState();
}

class _PageFichesState extends State<PageFiches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Text(widget.provenance),
      ),
      floatingActionButton: ExpandableFabDeclaration(),
    );
  }
}
