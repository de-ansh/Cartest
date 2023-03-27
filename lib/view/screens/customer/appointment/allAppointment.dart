import 'package:carcheck/provider/appointment_provider.dart';
import 'package:carcheck/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:carcheck/locator.dart';
import 'package:carcheck/view/base_widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../../../../util/color-resource.dart';
import '../../../base_widgets/getImage.dart';
import 'appointmentDetails.dart';
class AllAppointmnet extends StatefulWidget {
  const AllAppointmnet({Key? key}) : super(key: key);

  @override
  State<AllAppointmnet> createState() => _AllAppointmnetState();
}

class _AllAppointmnetState extends State<AllAppointmnet> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final String name;
  Widget container = Container();
  AuthProvider authProvider= locator<AuthProvider>();
  AppointmentProvider appointmentProvider= locator<AppointmentProvider>();
  @override
  void initState() {
    super.initState();
    int userid =authProvider.userDetails!.id;

    container= getAllData(appointmentProvider.getAppointmentByUsertableID(userid));

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBarWidget(context,_scaffoldKey,"Appoitments"),
      body: Consumer<AppointmentProvider>(
        builder: (context,model,child)=> Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: getAllData(model),
            )

          ],
        ),
      ),
    );
  }
}


getAllData(AppointmentProvider model){

  return Expanded(child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("All Appointments",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.AppointmentByUserId.length,
              itemBuilder: (BuildContext context, int index) {
                //int userid=model.AppointmentByUserId[index].userId;

                return GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => AppointmentDetailsUser(model.AppointmentByUserId[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                      leading: getImage(''),

                      title: Text('name'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( model.AppointmentByUserId[index].date),
                          SizedBox(height: 7,),
                          Container(
                              height: 25,
                              child:ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (builder) => AppointmentDetailsUser(model.AppointmentByUserId[index])));
                                },
                                style: ElevatedButton.styleFrom(
                                  onPrimary: ColorResources.BUTTON_COLOR,
                                  primary:  Colors.greenAccent,
                                  elevation: 3,
                                  // side: BorderSide(color: Colors.red, width: 1.5),
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                  child: Text( model.AppointmentByUserId[index].status,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white
                                      )),
                                ),
                              )

                          )
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                  ),
                );
                // child: GServiceCard(model.garageServiceListByGarageId[index],widget.garage));
              }
          ),
        )
      ],
    ),
  ),);
}


