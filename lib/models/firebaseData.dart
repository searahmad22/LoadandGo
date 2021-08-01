import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseData {

  void updateFirestoreDocument(orderNumber, {approvalStatus, customerCompany, customerFirstname, customerLastname, customerPhoneNumber,
      deliveryAddress1, deliveryAddress2, deliveryDate, deliveryPostalCode, merchantName, orderInfo, orderPickupAddress,
      orderPickupDate, orderPickupPostalCode, orderQuantity, orderWeight}) {


    var firestore = FirebaseFirestore.instance.collection("orders");
    firestore.doc(orderNumber).set({
      "approvalStatus": approvalStatus,
      "customerCompany": customerCompany,
      "customerFirstname": customerFirstname,
      "customerLastname": customerLastname,
      "customerPhoneNumber": customerPhoneNumber,
      "deliveryAddress1": deliveryAddress1,
      "deliveryAddress2": deliveryAddress2,
      "deliveryDate": deliveryDate,
      "deliveryPostalCode": deliveryPostalCode,
      "merchantName": merchantName,
      "orderInfo": orderInfo,
      "orderNumber": orderNumber,
      "orderPickupAddress": orderPickupAddress,
      "orderPickupDate": orderPickupDate,
      "orderPickupPostalCode": orderPickupPostalCode,
      "orderQuantity": orderQuantity,
      "orderWeight": orderWeight,
    });
  }


  void deleteFirestoreDocument(List<String> selectedList, dataCollection) {
    var firestore = FirebaseFirestore.instance.collection(dataCollection);

    for (String id in selectedList) {
      firestore.doc(id).delete();
    }
  }
}