import 'package:emmaus_dea/class/api/CategorieMeubleService.dart';
import 'package:emmaus_dea/class/api/ProvenanceService.dart';
import 'package:emmaus_dea/models/CategorieMeuble.dart';
import 'package:emmaus_dea/widgets/Declaration/CardDeclaration.dart';
import 'package:emmaus_dea/widgets/Declaration/ExpandableFabDeclaration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../class/api/FicheTracabiliteService.dart';
import '../models/FicheTracabilite.dart';
import '../models/Provenance.dart';
import '../widgets/Declaration/CardProvenance.dart';

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
    provenances = [];
    loadProvenances();
  }

  Future<void> loadProvenances() async {
    try {
      final provs = await ProvenanceService.getProvenances();
      if (provs != null) {
        setState(() {
          provenances = provs;
        });
        // Appel API pour chaque provenance et stockage des données dans le map
        for (var prov in provs) {
          final fiches = await fetchFichesTracabilite(prov.Id);
          fichesMap[prov.Id] = fiches;
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Erreur lors du chargement des provenances."),
            ),
          );
        }
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erreur lors du chargement des provenances: $error"),
          ),
        );
      }
    }
  }

  Future<List<FicheTracabilite>?> fetchFichesTracabilite(
      int provenanceId) async {
    try {
      final listeFiches =
          await FicheTracabiliteService.getFichesTracabiliteByProvenance(
              provenanceId);
      print(listeFiches);
      return listeFiches;
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erreur lors du chargement des fiches : $error"),
          ),
        );
      }
    }
    return null;
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
          // RefreshIndicator(
          //   child:
          ListView.builder(
            itemBuilder: (context, index) {
              return CardProvenance(
                provenance: provenances[index],
                fiches: fichesMap[provenances[index].Id],
              );
            },
            itemCount: provenances.length,
          ),
          // onRefresh: () async {
          //   refreshCardProvenance();
          // },
          // ),
          FutureBuilder<List<CategorieMeuble>?>(
            future: CategorieMeubleService.getCategoriesMeuble(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final provenances = snapshot.data;
                if (provenances != null) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return CardDeclaration();
                    },
                    itemCount: provenances.length,
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
          )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFabDeclaration(),
    );
  }
}
