class MembersResponse {
  MembersResponse({
    this.data,
    this.message
  });

  MembersData? data;
  String? message;

  factory MembersResponse.fromJson(Map<String, dynamic> json) => MembersResponse(
        data: MembersData.fromJson(json['data']),
        message: json['message'],
    );
}

class MembersData {
  MembersData({
    this.pageSamiti,
  });

  List<PageSamiti>? pageSamiti;

  factory MembersData.fromJson(Map<String, dynamic> json) => MembersData(
        pageSamiti: List<PageSamiti>.from(
            json['pageSamiti'].map((x) => PageSamiti.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'pageSamiti': List<dynamic>.from(
            (pageSamiti ?? <PageSamiti>[]).map((x) => x.toJson())),
      };
}

class PageSamiti {
  PageSamiti({
    this.id,
    this.pageNo,
    this.boothNo,
    this.name,
    this.address,
    this.contactNo,
    this.designation,
    this.vaccineStatus,
    this.vidhansabha,
    this.ward,
    this.shaktikendra,
    this.shaktikendraMobile,
    this.incharge,
    this.inchargeMobile,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? pageNo;
  String? boothNo;
  String? name;
  String? address;
  String? contactNo;
  String? designation;
  dynamic vaccineStatus;
  String? vidhansabha;
  String? ward;
  String? shaktikendra;
  dynamic shaktikendraMobile;
  String? incharge;
  String? inchargeMobile;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PageSamiti.fromJson(Map<String, dynamic> json) => PageSamiti(
        id: json['id'],
        pageNo: json['page_no'],
        boothNo: json['booth_no'],
        name: json['name'],
        address: json['address'],
        contactNo: json['contact_no'],
        designation: json['designation'],
        vaccineStatus: json['vaccine_status'],
        vidhansabha: json['vidhansabha'],
        ward: json['ward'],
        shaktikendra: json['shaktikendra'],
        shaktikendraMobile: json['shaktikendra_mobile'],
        incharge: json['incharge'],
        inchargeMobile: json['incharge_mobile'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'page_no': pageNo,
        'booth_no': boothNo,
        'name': name,
        'address': address,
        'contact_no': contactNo,
        'designation': designation,
        'vaccine_status': vaccineStatus,
        'vidhansabha': vidhansabha,
        'ward': ward,
        'shaktikendra': shaktikendra,
        'shaktikendra_mobile': shaktikendraMobile,
        'incharge': incharge,
        'incharge_mobile': inchargeMobile,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
