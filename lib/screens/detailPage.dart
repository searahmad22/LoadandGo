import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot order;
  DetailPage({required this.order});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = widget.order.data() as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Order Description")),
      ),
      body: Container(
        child: Card(
          child: Center(
            child: ListTile(
              subtitle: Text("Order Number: ${data["orderNumber"]}\nOrder Info: ${data["orderInfo"]}\nOrder Weight: ${data["orderWeight"]}\n"
                  "Quantity: ${data["orderQuantity"]}\nPickup Date: ${data["orderPickupDate"]}\nPickup Address: ${data["orderPickupAddress"]}\n"
                  "Pickup Postal Code: ${data["orderPickupPostalCode"]}\nDelivery Date: ${data["deliveryDate"]}\nDelivery Address 1: ${data["deliveryAddress1"]}\n"
                  "Delivery Address 2: ${data["deliveryAddress2"]}\nDelivery Postal Code: ${data["deliveryPostalCode"]}\nCustomer First Name: ${data["customerFirstname"]}\n"
                  "Customer Last Name: ${data["customerLastname"]}\nCustomer Phone Number: ${data["customerPhoneNumber"]}\nCustomer Company: ${data["customerCompany"]}\n"
                  "Merchant Name: ${data["merchantName"]}\nApproval Status: ${data["approvalStatus"] == false ? "Not Approved" : "Approved"}\n"),
            ),
          ),
        ),
      ),
    );
  }
}