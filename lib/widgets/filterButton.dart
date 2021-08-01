import 'package:flutter/material.dart';
import 'package:untitled/widgets/filterChipWidget.dart';

Widget filterButton(context, filterAreaCode, filterPickupDate, filterDeliveryDate, filterMerchantName) {

  return FloatingActionButton(
    child: Text("Filter", style: TextStyle(
        color: Colors.white
    ),),
    backgroundColor: Colors.deepOrangeAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    onPressed: () {

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.deepOrangeAccent,
              scrollable: true,
              title: Text('Filter', style: TextStyle(color: Colors.white),),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: [
                      FilterChipWidget(chipName: "Area Code", isSelected: filterAreaCode,),
                      FilterChipWidget(chipName: "Pickup Date", isSelected: filterPickupDate,),
                      FilterChipWidget(chipName: "Delivery Date", isSelected: filterDeliveryDate,),
                      FilterChipWidget(chipName: "Merchant Name", isSelected: filterMerchantName,),

                    ],
                  ),
                ),
              ),
            );
          });
    },
  );
}