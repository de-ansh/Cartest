import 'package:carcheck/locator.dart';
import 'package:carcheck/provider/bid_provider.dart';
import 'package:carcheck/util/color-resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BidsGarage extends StatefulWidget {
  BidsGarage({Key? key}) : super(key: key);

  @override
  State<BidsGarage> createState() => _BidsGarageState();
}

class _BidsGarageState extends State<BidsGarage> {
  final bidprovider = locator<BidProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bids",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(builder: (context, dataSnapshot) {
            future: bidprovider.GetAllBids();
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('An error occured'),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: bidprovider.allBidList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          //Navigator.pushReplacement(context,
                          //MaterialPageRoute(builder: (builder) => AppointmentDetails(model.allAppointment[0])));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            //  leading: getImage(''),
                            title: Text(bidprovider.GetallBidList[index].userOrder!
                                .userTable.firstName
                                .toString()),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(bidprovider.GetallBidList[index].name
                                    .toString()),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                    height: 25,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //  Navigator.pushReplacement(context,
                                        // MaterialPageRoute(builder: (builder) => AppointmentDetails(widget.appointmentList[index])));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        onPrimary:
                                            ColorResources.BUTTON_COLOR,
                                        primary: Colors.greenAccent,
                                        elevation: 3,
                                        // side: BorderSide(color: Colors.red, width: 1.5),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 5),
                                        child: Text(
                                            bidprovider.GetallBidList[index]
                                                .userOrder!.invoiceNumber
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                      ),
                                    ))
                              ],
                            ),
                            trailing:
                                Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ));
                  },
                );
              }
            }
          }),
        ],
      ),
    );
  }
}
