import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortingFilter extends ChangeNotifier {
  String field = 'orderQuantity';
  String sortOrder = 'Postal Code';
  List <String> sortList = [
    "orderPickupPostalCode", "orderPickupDate", "deliveryDate", "merchantName"
  ];

  String filterOrder = "orderNumber";

  bool filterAreaCode = false;
  bool filterDeliveryDate = false;
  bool filterPickupDate = false;
  bool filterMerchantName = false;


  bool isSelectable = true;
  bool isSelected = false;

  void setIsSelected(newSelected) {
    isSelected = !newSelected;
    notifyListeners();
  }

  void sortData (String newField) {
    field = newField;
    notifyListeners();
  }

  void setSortOrder (newSortOrder) {
    sortOrder = newSortOrder;
    notifyListeners();
  }

  void setFilterOrder(newFilterLabel) {
    filterOrder = newFilterLabel;
    notifyListeners();
  }

  void setFilterAreaCode(newFilterAreaCode) {
    filterAreaCode = newFilterAreaCode;
    notifyListeners();
  }

  void setFilterDeliveryDate(newFilterAreaCode) {
    filterDeliveryDate = newFilterAreaCode;
    notifyListeners();
  }

  void setFilterPickupDate(newFilterAreaCode) {
    filterPickupDate = newFilterAreaCode;
    notifyListeners();
  }

  void setFilterMerchantName(newFilterAreaCode) {
    filterMerchantName = newFilterAreaCode;
    notifyListeners();
  }


}