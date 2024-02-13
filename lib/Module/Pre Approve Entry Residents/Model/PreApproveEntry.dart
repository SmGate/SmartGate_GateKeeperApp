/// success : true
/// data : [{"id":3,"gatekeeperid":4,"userid":3,"visitortype":"Visiting Help","name":"Abi Rajput","description":"","cnic":null,"mobileno":"+921111111111","vechileno":"---","arrivaldate":"2023-09-06","arrivaltime":"22:49:00","status":2,"statusdescription":"CheckIn","checkintime":"09:45:00","checkouttime":null,"created_at":"2023-09-06T10:33:31.000000Z","updated_at":"2023-09-06T17:19:24.000000Z","firstname":"ali","lastname":"khan","address":"Rawat Encalve,block#1,street#1,house#1","password":"$2y$10$xL6pBc9n.vXZ/O3y2F9jBO6yXPIslgOrno3wa5MCJHuw0fOZzYI3S","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"clIWs3wbSJenayI3rfx5mO:APA91bH-ENXt5xrUo-KfjMMBXCqD7-qot3s7GBtC1Xy6qaBkXaecu_foHCJifp9XzRty0benk_lQLIA52_hL1ShbjHdkmvxWSEcMsnyFxcfGWVNztFyVrmU4AMtD0rfTsiXbP7fJrE9N"}]

class PreApproveEntry {
  PreApproveEntry({
    this.success,
    this.data,
  });

  PreApproveEntry.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;
  PreApproveEntry copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      PreApproveEntry(
        success: success ?? this.success,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// gatekeeperid : 4
/// userid : 3
/// visitortype : "Visiting Help"
/// name : "Abi Rajput"
/// description : ""
/// cnic : null
/// mobileno : "+921111111111"
/// vechileno : "---"
/// arrivaldate : "2023-09-06"
/// arrivaltime : "22:49:00"
/// status : 2
/// statusdescription : "CheckIn"
/// checkintime : "09:45:00"
/// checkouttime : null
/// created_at : "2023-09-06T10:33:31.000000Z"
/// updated_at : "2023-09-06T17:19:24.000000Z"
/// firstname : "ali"
/// lastname : "khan"
/// address : "Rawat Encalve,block#1,street#1,house#1"
/// password : "$2y$10$xL6pBc9n.vXZ/O3y2F9jBO6yXPIslgOrno3wa5MCJHuw0fOZzYI3S"
/// roleid : 3
/// rolename : "resident"
/// image : "images/user.png"
/// fcmtoken : "clIWs3wbSJenayI3rfx5mO:APA91bH-ENXt5xrUo-KfjMMBXCqD7-qot3s7GBtC1Xy6qaBkXaecu_foHCJifp9XzRty0benk_lQLIA52_hL1ShbjHdkmvxWSEcMsnyFxcfGWVNztFyVrmU4AMtD0rfTsiXbP7fJrE9N"

class Data {
  Data({
    this.id,
    this.gatekeeperid,
    this.userid,
    this.visitortype,
    this.name,
    this.description,
    this.cnic,
    this.mobileno,
    this.vechileno,
    this.arrivaldate,
    this.arrivaltime,
    this.status,
    this.statusdescription,
    this.checkintime,
    this.checkouttime,
    this.createdAt,
    this.updatedAt,
    this.firstname,
    this.lastname,
    this.address,
    this.password,
    this.roleid,
    this.rolename,
    this.image,
    this.fcmtoken,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    gatekeeperid = json['gatekeeperid'];
    userid = json['userid'];
    visitortype = json['visitortype'];
    name = json['name'];
    description = json['description'];
    cnic = json['cnic'];
    mobileno = json['mobileno'];
    vechileno = json['vechileno'];
    arrivaldate = json['arrivaldate'];
    arrivaltime = json['arrivaltime'];
    status = json['status'];
    statusdescription = json['statusdescription'];
    checkintime = json['checkintime'];
    checkouttime = json['checkouttime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    address = json['address'];
    password = json['password'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = json['fcmtoken'];
  }
  int? id;
  int? gatekeeperid;
  int? userid;
  String? visitortype;
  String? name;
  String? description;
  dynamic cnic;
  String? mobileno;
  String? vechileno;
  String? arrivaldate;
  String? arrivaltime;
  int? status;
  String? statusdescription;
  String? checkintime;
  dynamic checkouttime;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? address;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  String? fcmtoken;
  Data copyWith({
    int? id,
    int? gatekeeperid,
    int? userid,
    String? visitortype,
    String? name,
    String? description,
    dynamic cnic,
    String? mobileno,
    String? vechileno,
    String? arrivaldate,
    String? arrivaltime,
    int? status,
    String? statusdescription,
    String? checkintime,
    dynamic checkouttime,
    String? createdAt,
    String? updatedAt,
    String? firstname,
    String? lastname,
    String? address,
    String? password,
    int? roleid,
    String? rolename,
    String? image,
    String? fcmtoken,
  }) =>
      Data(
        id: id ?? this.id,
        gatekeeperid: gatekeeperid ?? this.gatekeeperid,
        userid: userid ?? this.userid,
        visitortype: visitortype ?? this.visitortype,
        name: name ?? this.name,
        description: description ?? this.description,
        cnic: cnic ?? this.cnic,
        mobileno: mobileno ?? this.mobileno,
        vechileno: vechileno ?? this.vechileno,
        arrivaldate: arrivaldate ?? this.arrivaldate,
        arrivaltime: arrivaltime ?? this.arrivaltime,
        status: status ?? this.status,
        statusdescription: statusdescription ?? this.statusdescription,
        checkintime: checkintime ?? this.checkintime,
        checkouttime: checkouttime ?? this.checkouttime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        address: address ?? this.address,
        password: password ?? this.password,
        roleid: roleid ?? this.roleid,
        rolename: rolename ?? this.rolename,
        image: image ?? this.image,
        fcmtoken: fcmtoken ?? this.fcmtoken,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['gatekeeperid'] = gatekeeperid;
    map['userid'] = userid;
    map['visitortype'] = visitortype;
    map['name'] = name;
    map['description'] = description;
    map['cnic'] = cnic;
    map['mobileno'] = mobileno;
    map['vechileno'] = vechileno;
    map['arrivaldate'] = arrivaldate;
    map['arrivaltime'] = arrivaltime;
    map['status'] = status;
    map['statusdescription'] = statusdescription;
    map['checkintime'] = checkintime;
    map['checkouttime'] = checkouttime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['address'] = address;
    map['password'] = password;
    map['roleid'] = roleid;
    map['rolename'] = rolename;
    map['image'] = image;
    map['fcmtoken'] = fcmtoken;
    return map;
  }
}
