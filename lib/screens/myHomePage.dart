import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/widgets/filterButton.dart';
import 'package:untitled/screens/allOrders.dart';
import 'package:untitled/provider/providerSortingFilter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> orders = FirebaseFirestore.instance.collection('orders').snapshots();
    final bool filterAreaCode = Provider.of<SortingFilter>(context).filterAreaCode;
    final bool filterPickupDate = Provider.of<SortingFilter>(context).filterPickupDate;
    final bool filterDeliveryDate= Provider.of<SortingFilter>(context).filterDeliveryDate;
    final bool filterMerchantName = Provider.of<SortingFilter>(context).filterMerchantName;


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Orders")),
      ),
      floatingActionButton: filterButton(context, filterAreaCode, filterPickupDate, filterDeliveryDate, filterMerchantName),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListPage(filterAreaCode, filterPickupDate, filterDeliveryDate, filterMerchantName, orders),
    );
  }
}