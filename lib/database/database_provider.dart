
import 'package:flutter_template/database/database_entity.dart';
import 'package:flutter_template/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  /// A Box of notes.
  late final Box<DataBaseMember> dataBaseMemberBox;

  ObjectBox._create(this.store) {
    dataBaseMemberBox = Box<DataBaseMember>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  ObjectBox.removeAllData() {
    dataBaseMemberBox.removeAll();
  }
}

// flutter packages pub run build_runner build
//flutter packages pub run build_runner build --delete-conflicting-outputs