import 'package:carcheck/util/app_constants.dart';

class ApiConstants{




  //User Table
  static String LOGIN = AppConstants.BASE_URL + "/UserTable/authLogin/";
  static String REGISTRATION = AppConstants.BASE_URL + "/UserTable/UserTable/save";
  static String UPDATE_USER_PROFILE = AppConstants.BASE_URL + "/UserTable/UserTable/update";
  static String DELETE_USER = AppConstants.BASE_URL + "/UserTable/UserTable/";
  static String GET_ALL_USER = AppConstants.BASE_URL + "/UserTable/UserTable/getAll";
  static String SAVE_GARAGE = AppConstants.BASE_URL + "/api/garage/save";
  static String ADD_VEHICLE = AppConstants.BASE_URL + "/Vehicle/Vehicle/save";


  //address-controller
  static String DELETE_Address= AppConstants.BASE_URL + "/api/address/deleteById?id=1";
  static String SAVE_Address =  AppConstants.BASE_URL+ "/api/address/save";
  static String GET_All_Address= AppConstants.BASE_URL + "/api/address/getAll";
  static String Get_By_City_Id= AppConstants.BASE_URL+ "/api/address/getByCityId";
  static String Get_Address_By_Id = AppConstants.BASE_URL+ "/api/address/getById";
  static String UPDATE_Address= AppConstants.BASE_URL + "/api/address/update";
  static String Get_Address_by_ZipCode= AppConstants.BASE_URL+ "/api/getAddressbyzipcode";
  static String Get_Address_For_User= AppConstants.BASE_URL+ "/api/getAddressForUser";


  //Appointment
  static String DELETE_Appointment= AppConstants.BASE_URL+"/api/Appointment/deleteById";
  static String SAVE_Appointment=AppConstants.BASE_URL+"/api/Appointment/save";
  static String GET_Appointment_BY_ID= AppConstants.BASE_URL+"/api/Appointment/getById";
  static String GET_All_Appointment= AppConstants.BASE_URL+"/api/Appointment/getAll";
  static String Get_Appointment_By_Garage_ID=AppConstants.BASE_URL+"/api/Appointment/getByGarrageId";
  static String Get_Appointment_By_User_ID= AppConstants.BASE_URL+"/api/Appointment/getByUserTableId";
  //Transaction
  static String SAVE_Transaction= AppConstants.BASE_URL+"/TrasactionPayment/TrasactionPayment/save";
  static String GET_All_Transactions= AppConstants.BASE_URL+"/TrasactionPayment/TrasactionPayment/getAll";


  //Bids
  static String GET_ALL_UserOrder_bids= AppConstants.BASE_URL+"/api/bidding/getAll";
  static String Generate_bids=AppConstants.BASE_URL+"/api/bidding/save";
  //static String GET_ALL_UserOrder_bids_By_User_ID= AppConstants.BASE_URL+
  static String Get_User_Order_bids_by_ID= AppConstants.BASE_URL+"/api/bidding/getById";

  //Bids_Placing
  static String Get_all_Placed_bids= AppConstants.BASE_URL+"/api/bid/getAll";
  static String Place_BID= AppConstants.BASE_URL+"/api/bid/save";
  static String Get_By_BidID=AppConstants.BASE_URL+"/api/bid/getById";



}