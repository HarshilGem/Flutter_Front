class List_Class {
  List<Result>? result;

  List_Class({this.result});

  List_Class.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? name;
  String? address;
  int? contact;
  String? reqworker;
  int? noworker;
  String? desc;
  String? jobtype;
  int? salary;
  String? timefrom;
  String? timeto;
  String? email;
  int? iV;

  Result(
      {this.sId,
        this.name,
        this.address,
        this.contact,
        this.reqworker,
        this.noworker,
        this.desc,
        this.jobtype,
        this.salary,
        this.timefrom,
        this.timeto,
        this.email,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    reqworker = json['reqworker'];
    noworker = json['noworker'];
    desc = json['desc'];
    jobtype = json['jobtype'];
    salary = json['salary'];
    timefrom = json['timefrom'];
    timeto = json['timeto'];
    email = json['email'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['reqworker'] = this.reqworker;
    data['noworker'] = this.noworker;
    data['desc'] = this.desc;
    data['jobtype'] = this.jobtype;
    data['salary'] = this.salary;
    data['timefrom'] = this.timefrom;
    data['timeto'] = this.timeto;
    data['email'] = this.email;
    data['__v'] = this.iV;
    return data;
  }
}