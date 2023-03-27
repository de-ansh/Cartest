import 'package:flutter/material.dart';
import 'package:carcheck/model/Appointment.dart';
class AppointmentDetailsUser extends StatefulWidget {
  Appointment appointment;

  AppointmentDetailsUser(this.appointment,{Key? key}) : super(key: key);

  @override
  State<AppointmentDetailsUser> createState() => _AppointmentDetailsUserState();
}

class _AppointmentDetailsUserState extends State<AppointmentDetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

