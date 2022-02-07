
import 'package:objectbox/objectbox.dart';

@Entity()
class DataBaseMember {
  // @Id(assignable: true)
  int? id;
  String? pageNo;
  String? boothNo;
  String? name;
  String? address;
  String? contactNo;
  String? designation;
  String? vaccineStatus;
  String? vidhansabha;
  String? ward;
  String? shaktikendra;
  String? shaktikendraMobile;
  String? incharge;
  String? inchargeMobile;
  DateTime? createdAt;
  DateTime? updatedAt;
}

