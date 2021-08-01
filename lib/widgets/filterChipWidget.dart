import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/providerSortingFilter.dart';

class FilterChipWidget extends StatefulWidget {
  String? chipName;
  bool isSelected;

  FilterChipWidget({Key? key, this.chipName, required this.isSelected}) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName!),
      labelStyle: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
      backgroundColor: Colors.black38,
      selected: widget.isSelected,
      onSelected: (isSelected){


        switch(widget.chipName) {
          case "Area Code": {

            Provider.of<SortingFilter>(context, listen: false).setFilterAreaCode(isSelected);
          }
          break;

          case "Delivery Date": {
            Provider.of<SortingFilter>(context, listen: false).setFilterDeliveryDate(isSelected);
          }
          break;

          case "Pickup Date": {
            Provider.of<SortingFilter>(context, listen: false).setFilterPickupDate(isSelected);
          }
          break;

          default: {
            Provider.of<SortingFilter>(context, listen: false).setFilterMerchantName(isSelected);
          }
          break;
        }

        setState(() {
          widget.isSelected = isSelected;
        });
      },
    );
  }
}