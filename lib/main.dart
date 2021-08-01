import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/providerSortingFilter.dart';
import 'package:untitled/screens/myHomePage.dart';
import 'models/firebaseData.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SortingFilter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Load and Go',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,
          appBarTheme:AppBarTheme(color: Colors.black26),

        ),
        home: MyHomePage(title: "All Orders"),
      ),
    );
  }
}





