import 'package:emmaus_dea/pages/page_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'models/FicheTracabilite.dart';

void main() async {
  await dotenv.load();
  initializeDateFormatting('fr_FR', null).then((_) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => FicheTracabiliteModel()),
            // Provider(create: (context) => SomeOtherClass()),
          ],
          child: const MyApp(),
        ),
      ));
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PageHome(),
    );
  }
}
