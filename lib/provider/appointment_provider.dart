import 'dart:convert';
import 'package:carcheck/model/Appointment.dart';
import 'package:carcheck/model/services.dart';
import 'package:carcheck/model/subservices_model.dart';
import 'package:carcheck/response/add_appointment_response.dart';
import 'package:carcheck/util/api_constants.dart';
import 'package:carcheck/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class AppointmentProvider extends ChangeNotifier {
  List<Appointment> allAppointment = [];
  List<Appointment> appointmentByGarageId = [];
  List<Appointment> AppointmentBySubServiceID = [];
  List<Appointment> AppointmentByUserId=[];
  List<Service> allServices = [];
  List<SubService> allSubServices = [];
  List<String> subServicesNameList = [];
  bool isLoading = false;

  getAllAppointment({int currentPage =0}) async {
    isLoading = true;
    notifyListeners();
    if (currentPage == 0) {
      allAppointment.clear();
    }
    String myUrl = ApiConstants.GET_All_Appointment;
    print(myUrl);
    var req = await http.get(Uri.parse(myUrl));
    isLoading = false;
    if (req.statusCode == 200) {
      var response = json.decode(req.body);
      var type = AddAppointmentResponse.fromJson(response);
      allAppointment.clear();
      allAppointment.add(type.data);
      print(allAppointment[currentPage]);
      notifyListeners();
      return type;
    }
  }

  getAppointmentByGarageId(int? garageId) async {
    isLoading = true;
    notifyListeners();
    String myUrl = ApiConstants.Get_Appointment_By_Garage_ID + "?id=${garageId}";
    print(myUrl);
    var req = await http.get(Uri.parse(myUrl));
    isLoading= false;
    if (req.statusCode == 200) {
      var response = json.decode(req.body);
      var type1 = AddAppointmentResponse.fromJson(response);
      appointmentByGarageId.clear();
      appointmentByGarageId.add(type1.data);
      print("Appointmnet: ${type1.data.garrageId}");
      notifyListeners();

    }
  }


  getAppointmentByUsertableID(int? UserID) async{
    isLoading= true;
    notifyListeners();
    String myUrl= ApiConstants.Get_Appointment_By_User_ID+"?id=${UserID}";
    print(myUrl);
    var req= await http.get(Uri.parse(myUrl));
    isLoading= false;
    if(req.statusCode==200){
      var response = json.decode(req.body) ;
      var type2= AddAppointmentResponse.fromJson(response);
      AppointmentByUserId.clear();
      AppointmentByUserId.add(type2.data);
      print(AppointmentByUserId[0]);
      notifyListeners();
      return type2;
    }
  }
  getAppointmentBySubServiceID(int? SubServiceID) async {
    isLoading = true;
    notifyListeners();
    String myUrl = AppConstants.BASE_URL + "/api/Appointment/getBySubserviceId?id=${SubServiceID}";
    print(myUrl);
    var req = await http.get(Uri.parse(myUrl));
    if (req.statusCode == 200) {
      var response = json.decode(req.body);
      var type3 = AddAppointmentResponse.fromJson(response);
      AppointmentBySubServiceID.clear();
      AppointmentBySubServiceID.add(type3.data);
      print(AppointmentBySubServiceID[0]);
      notifyListeners();

    }
  }

  SaveAppointment(
      {bool? accept,
        bool? active,
        String? availableTime,
        String? date,
        int? garrageId,
        int? id,
        String? status,
        int? SubServiceId,
        String? time,
        int? userId,
        int? VehicleId
      }) async {
    String myUrl = ApiConstants.GET_All_Appointment;
    Uri uri = Uri.parse(myUrl);
    print(myUrl);
    Map<String, dynamic> data = {
      "accept": accept,
      "active": active,
      "availableTime": availableTime,
      "date": date,
      "garrageId": garrageId,
      "status": status,
      "subServiceId": SubServiceId,
      "time": time,
      "userId": userId,
      "vehicleId": VehicleId
    };
    var body = json.encode(data);
    print(data);
    var createResponse = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${createResponse.statusCode}" +
        " --- " +
        createResponse.body.toString());
    var response = await json.decode(createResponse.body);
    var list = AddAppointmentResponse.fromJson(response);
    allAppointment.add(list.data);
    notifyListeners();
  }
}