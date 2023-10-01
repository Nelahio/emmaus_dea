import 'package:emmaus_dea/class/api/CategorieMeubleService.dart';
import 'package:emmaus_dea/class/api/ProvenanceService.dart';
import 'package:emmaus_dea/models/CategorieMeuble.dart';
import 'package:emmaus_dea/models/FicheTracabilite.dart';
import 'package:emmaus_dea/models/Provenance.dart';
import 'package:emmaus_dea/widgets/Declaration/CardDeclaration.dart';
import 'package:emmaus_dea/widgets/Declaration/ExpandableFabDeclaration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:provider/provider.dart';

import '../../class/api/FicheTracabiliteService.dart';
import '../../widgets/Declaration/CardProvenance.dart';

class PageDeclaration extends StatefulWidget {
  const PageDeclaration({Key? key}) : super(key: key);

  @override
  State<PageDeclaration> createState() => _PageDeclarationState();
}

class _PageDeclarationState extends State<PageDeclaration>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Provenance> provenances = [];
  Map<int, List<FicheTracabilite>?> fichesMap = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadProvenances();
  }

  Future<void> loadProvenances() async {
    try {
      final provs = await ProvenanceService.getProvenances();
      if (provs != null) {
        setState(() {
          provenances = provs;
        });
        for (var prov in provs) {
          fetchFichesTracabilite(prov.Id);
        }
      } else {
        showSnackBar("Erreur lors du chargement des provenances.");
      }
    } catch (error) {
      showSnackBar("Erreur lors du chargement des provenances: $error");
    }
  }

  Future<void> fetchFichesTracabilite(int provenanceId) async {
    try {
      final listeFiches =
          await FicheTracabiliteService.getFichesTracabiliteByProvenance(
              provenanceId);

      if (listeFiches != null) {
        context
            .read<FicheTracabiliteModel>()
            .updateFiches(provenanceId, listeFiches);
        // Informez les widgets écoutants que les données ont changé
        context.read<FicheTracabiliteModel>().notifyListeners();
      }
    } catch (error) {
      print(error);
      showSnackBar("Erreur lors du chargement des fiches: $error");
    }
  }

  void showSnackBar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  Widget buildProvenanceList() {
    return RefreshIndicator(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CardProvenance(
            provenance: provenances[index],
          );
        },
        itemCount: provenances.length,
      ),
      onRefresh: () async {
        loadProvenances();
      },
    );
  }

  Widget buildCategorieMeubleList() {
    return FutureBuilder<List<CategorieMeuble>?>(
      future: CategorieMeubleService.getCategoriesMeuble(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final categories = snapshot.data;
          if (categories != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CardDeclaration();
              },
              itemCount: categories.length,
            );
          } else {
            return Center(
              child: Text("Erreur lors de la récupération des données."),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text("État de connexion non géré"),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
          automaticIndicatorColorAdjustment: true,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Fiches de traçabilité",
            ),
            Tab(
              text: "Déclarations trimestrielles",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildProvenanceList(),
          buildCategorieMeubleList(),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFabDeclaration(),
    );
  }
}
