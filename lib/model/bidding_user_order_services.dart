import 'package:carcheck/model/bid_model.dart';
import 'package:carcheck/model/subservices_model.dart';
import 'package:carcheck/model/user_order_model.dart';
import 'package:carcheck/model/vehicle_model.dart';

/*class BiddingUserOrderService {
  BiddingUserOrderService({
    required this.id,
    required this.created,
    required this.createdBy,
    required this.updated,
    required this.updatedBy,
    required this.active,
    required this.userOrder,
    required this.subservice,
  });
  late final int id;
  late final String created;
  late final String createdBy;
  late final String updated;
  late final String updatedBy;
  late final bool active;
  late final UserOrder userOrder;
  late final SubService subservice;

  BiddingUserOrderService.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    created = json['created']??'';
    createdBy = json['createdBy']??'';
    updated = json['updated']??'';
    updatedBy = json['updatedBy']??"";
    active = json['active']??true;
    userOrder = UserOrder.fromJson(json['userOrder']);
    subservice = SubService.fromJson(json['subservice']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created'] = created;
    _data['createdBy'] = createdBy;
    _data['updated'] = updated;
    _data['updatedBy'] = updatedBy;
    _data['active'] = active;
    _data['userOrder'] = userOrder.toJson();
    _data['subservice'] = subservice.toJson();
    return _data;
  }
}


 */

class bidding_user_service_table {
  String? message;
  List<BiddingData>? data;
  bool? success;

  bidding_user_service_table({this.message, this.data, this.success});

  bidding_user_service_table.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BiddingData>[];
      json['data'].forEach((v) {
        data!.add(new BiddingData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class BiddingData {
  List<Bid>? biddingDtls;
  int? id;
  String? created;
  String? createdBy;
  String? updated;
  String? updatedBy;
  bool? active;
  UserOrder? userOrder;
  SubService? subservice;
  Vehicle? vehicle;
  String? name;

  BiddingData(
      { required this.biddingDtls,
       required this.id,
       required  this.created,
       required this.createdBy,
       required this.updated,
       required this.updatedBy,
       required this.active,
       required this.userOrder,
       required this.subservice,
       required this.vehicle,
       required this.name});

  BiddingData.fromJson(Map<String, dynamic> json) {
    if (json['bidding_dtls'] != null) {
      biddingDtls = <Bid>[];
      json['bidding_dtls'].forEach((v) {
        biddingDtls!.add(new Bid.fromJson(v));
      });
    }
    id = json['id'];
    created = json['created'];
    createdBy = json['createdBy'];
    updated = json['updated'];
    updatedBy = json['updatedBy'];
    active = json['active'];
    userOrder = json['userOrder'] != null
        ? new UserOrder.fromJson(json['userOrder'])
        : null;
    subservice = json['subservice'] != null
        ? new SubService.fromJson(json['subservice'])
        : null;
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.biddingDtls != null) {
      data['bidding_dtls'] = this.biddingDtls!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['created'] = this.created;
    data['createdBy'] = this.createdBy;
    data['updated'] = this.updated;
    data['updatedBy'] = this.updatedBy;
    data['active'] = this.active;
    if (this.userOrder != null) {
      data['userOrder'] = this.userOrder!.toJson();
    }
    if (this.subservice != null) {
      data['subservice'] = this.subservice!.toJson();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

