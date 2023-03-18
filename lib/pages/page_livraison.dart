import 'package:flutter/material.dart';

class PageLivraison extends StatefulWidget {
  const PageLivraison({Key? key}) : super(key: key);

  @override
  State<PageLivraison> createState() => _PageLivraisonState();
}

class _PageLivraisonState extends State<PageLivraison> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Livraison"),
      ),
    );
  }
}
