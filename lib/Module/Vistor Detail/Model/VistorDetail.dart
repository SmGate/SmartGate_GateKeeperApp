class VistorDetail {
  VistorDetail({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  VistorDetail.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.gatekeeperid,
    required this.societyid,
    required this.subadminid,
    required this.houseaddress,
    required this.visitortype,
    required this.name,
    required this.cnic,
    required this.mobileno,
    required this.vechileno,
    required this.arrivaldate,
    required this.arrivaltime,
    required this.checkoutdate,
    required this.checkouttime,
    required this.status,
    required this.statusdescription,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int gatekeeperid;
  late final int societyid;
  late final int subadminid;
  late final String houseaddress;
  late final String visitortype;
  late final String name;
  late final String cnic;
  late final String mobileno;
  late final String vechileno;
  late final String arrivaldate;
  late final String arrivaltime;
  late final String checkoutdate;
  late final String checkouttime;
  late final int status;
  late final String statusdescription;
  late final String createdAt;
  late final String updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    gatekeeperid = json['gatekeeperid'];
    societyid = json['societyid'];
    subadminid = json['subadminid'];
    houseaddress = json['houseaddress'];
    visitortype = json['visitortype'];
    name = json['name'];
    cnic = json['cnic'];
    mobileno = json['mobileno'];
    vechileno = json['vechileno'];
    arrivaldate = json['arrivaldate'];
    arrivaltime = json['arrivaltime'];
    checkoutdate = json['checkoutdate'];
    checkouttime = json['checkouttime'];
    status = json['status'];
    statusdescription = json['statusdescription'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['gatekeeperid'] = gatekeeperid;
    _data['societyid'] = societyid;
    _data['subadminid'] = subadminid;
    _data['houseaddress'] = houseaddress;
    _data['visitortype'] = visitortype;
    _data['name'] = name;
    _data['cnic'] = cnic;
    _data['mobileno'] = mobileno;
    _data['vechileno'] = vechileno;
    _data['arrivaldate'] = arrivaldate;
    _data['arrivaltime'] = arrivaltime;
    _data['checkoutdate'] = checkoutdate;
    _data['checkouttime'] = checkouttime;
    _data['status'] = status;
    _data['statusdescription'] = statusdescription;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}