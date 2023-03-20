import 'package:flutter/material.dart';

class PageRamasse extends StatefulWidget {
  const PageRamasse({Key? key}) : super(key: key);

  @override
  State<PageRamasse> createState() => _PageRamasseState();
}

class _PageRamasseState extends State<PageRamasse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ramasses"),
      ),
    );
  }
}
