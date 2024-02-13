class Api {
  //static const String baseUrl = 'https://www.smartgate.pk/api/';
  // static const String imageBaseUrl = 'http://192.168.100.7:8000/storage/';
  // static const String baseUrl = 'http://192.168.100.7:8000/api/';

  static const String imageBaseUrl = 'https://www.smartgate.pk/storage/';
  static const String baseUrl = 'https://www.smartgate.pk/api/';
  static const String login = baseUrl + "login";
  static const String fcmtokenrefresh = baseUrl + "fcmtokenrefresh";
  static const String preapproventrynotifications =
      baseUrl + "preapproventrynotifications";
  static const String preapproveentryresidents =
      baseUrl + "preapproveentryresidents";
  static const String updatepreapproveentrystatus =
      baseUrl + "updatepreapproveentrystatus";
  static const String updatepreapproveentrycheckoutstatus =
      baseUrl + "updatepreapproveentrycheckoutstatus";
  static const String preapproveentries = baseUrl + "preapproveentries";

  static const String viewallnoticesapi = baseUrl + "viewallnotices";
  static const String viewevent = baseUrl + "event/events";
  static const String viewvistordetail = baseUrl + "viewvistordetail";
  static const String addvistordetail = baseUrl + "addvistordetail";
  static const String searchResident = baseUrl + "searchResident";
  static const String updateVistorStatus = baseUrl + "updateVistorStatus";
  static const String viewEmergency = baseUrl + "viewEmergency";
  static const String logout = baseUrl + "logout";
  static const String unapprovedpreapproveentrycount =
      baseUrl + "unapprovedpreapproveentrycount";
}
