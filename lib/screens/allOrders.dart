import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detailPage.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/providerSortingFilter.dart';
import 'package:untitled/widgets/dataRow.dart';

class ListPage extends StatefulWidget {


  Stream<QuerySnapshot>? orders;
  bool? filterAreaCode;
  bool? filterPickupDate;
  bool? filterDeliveryDate;
  bool? filterMerchantName;
  ListPage(this.filterAreaCode, this.filterPickupDate, this.filterDeliveryDate, this.filterMerchantName, this.orders,{Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  navigateToDetail(DocumentSnapshot order) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(order: order)));
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Flexible(
            child: DropdownButton(
              hint: Text("Sort"),
              icon: Icon(Icons.arrow_drop_down,
                size: 28.0,),
              onChanged: (String? newValue) {
                Provider.of<SortingFilter>(context, listen: false).sortData(newValue!);
                print(Provider.of<SortingFilter>(context, listen: false).field);
              },
              items: Provider.of<SortingFilter>(context).sortList.map((valueItem){
                return DropdownMenuItem(value: valueItem,
                  child: Text(valueItem),);
              }).toList(),
            ),
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 600.0,
            child: StreamBuilder<QuerySnapshot>(
              stream: widget.orders,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong.");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                final data = snapshot.requireData;

                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {

                    //converter for dates
                    var orderPickupDate = DateTime.parse((data.docs[index]["orderPickupDate"]).toDate().toString());
                    var deliveryDate = DateTime.parse((data.docs[index]["deliveryDate"]).toDate().toString());

                    //data from firestore
                    var orderNumber = data.docs[index]["orderNumber"];
                    var orderPickupPostalCode = (data.docs[index]["orderPickupPostalCode"]).toString().substring(0,2);
                    var merchantName = data.docs[index]["merchantName"];

                    bool isSelectable = false;
                    bool isSelected = false;


                    return GestureDetector(
                      onTap: () {
                        if (isSelectable == false) {
                          return navigateToDetail(data.docs[index]);
                        }
                        else {
                        }
                        print(isSelected);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isSelectable ? (isSelected ? Icon(Icons.check_box, color: Colors.deepOrangeAccent, size: 16.0) : Icon(Icons.check_box_outline_blank, size: 16.0)) : SizedBox(),
                          Expanded(
                            child: dataRow(orderNumber),
                          ),
                          widget.filterAreaCode! ? Expanded(
                            child: dataRow("Area Code: "+orderPickupPostalCode.toString().substring(0,2)),) : SizedBox(),
                          widget.filterPickupDate! ? Expanded(
                            child: dataRow("Pickup Date: ${orderPickupDate.toString().substring(0,10)}"),) : SizedBox(),
                          widget.filterDeliveryDate! ? Expanded(
                            child: dataRow("Delivery Date: ${deliveryDate.toString().substring(0,10)}")) : SizedBox(),
                          widget.filterMerchantName! ? Expanded(
                            child: dataRow("Merchant Name: "+merchantName)) : SizedBox(),
                        ],
                      ),
                    );
                  },

                );
              },
            ),
          ),
        ),
      ],
    );
  }
}