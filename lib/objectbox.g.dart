// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'database/database_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 491181692987291495),
      name: 'DataBaseMember',
      lastPropertyId: const IdUid(111, 2267319042543009382),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2414544906011042427),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(97, 3946111480055970344),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(98, 2271571591710272913),
            name: 'updatedAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(99, 9162884598080109204),
            name: 'pageNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(100, 4302629905342748978),
            name: 'boothNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(101, 3758627628708107499),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(102, 1447630239543111432),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(103, 4623409847374520326),
            name: 'contactNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(104, 4130319296966736666),
            name: 'designation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(105, 7745065334310076379),
            name: 'vidhansabha',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(106, 8967666531683821633),
            name: 'ward',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(107, 6149455847570705557),
            name: 'shaktikendra',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(108, 5972082690220833939),
            name: 'incharge',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(109, 7627963175791008738),
            name: 'inchargeMobile',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(110, 7151508848952208452),
            name: 'vaccineStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(111, 2267319042543009382),
            name: 'shaktikendraMobile',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 491181692987291495),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        7197614338256160043,
        2203257746166866498,
        6516083319770587069,
        645441520070475802,
        7187201641886752840,
        4803869353225754156,
        1738482912287240657,
        1278458084274834290,
        6209567375877685547,
        3517871239484037178,
        4393096149706205839,
        5827642052873040823,
        2736157567907213495,
        2069034179622706433,
        2200705251364343057,
        1910834824224000365,
        3001000259741146965,
        7922695363281345412,
        7741643359079894841,
        4316339028905888452,
        9165969937166840748,
        2527759329210180771,
        6441886964816678707,
        2417870660913751510,
        3206413485918808662,
        6759575220099815438,
        8821024623763134432,
        2808555403334316393,
        1462893763900604920,
        3453692323266955677,
        2740471177629399265,
        2808960152119196147,
        5418788600707213655,
        7992250242362142322,
        8877769890811971196,
        1383243685592276163,
        861619941417885057,
        720763409252495958,
        7999426337031607523,
        122263041373513685,
        3232708235857992003,
        5009208237399310706,
        901886799888931945,
        8528969277846252886,
        3308364216746653151,
        4296759374319245573,
        9013528732447871422,
        5641976554995464044,
        6620758744690238255,
        6435049566272729014,
        4088581281316061321,
        3107169981340494938,
        3825314893361604964,
        9092532905834116207,
        3143981758764574026,
        7084049972561872557,
        2866443779376585166,
        9059468561413929138,
        6318802051416504143,
        125788521247592469,
        8215235109090104936,
        6814586739589018891,
        315097556334358714,
        4976628900197251334,
        7092800895951827215,
        8878870494817259397,
        8922421831194661237,
        2965599234434092282,
        1937128881476513624,
        123147538625506713,
        6153044146760110932,
        7497948195800540421,
        8030027852089375623,
        7384699708184124530,
        7609027761377110672,
        6076057827375422762,
        4739964760648292572,
        702693862853347742,
        5311595601319231985,
        6237255197706221325,
        4890898642392407804,
        3945775847024509683,
        8129587143923171744,
        8996907563633802849,
        1697573841162728663,
        3060051728765297721,
        8096274144287315538,
        5110928721353556835,
        7915365511978975642,
        395880439840100884,
        7898745963546770022,
        4536814984468871518,
        5849880671491157248,
        4718015835567895850,
        1481898556384202471
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    DataBaseMember: EntityDefinition<DataBaseMember>(
        model: _entities[0],
        toOneRelations: (DataBaseMember object) => [],
        toManyRelations: (DataBaseMember object) => {},
        getId: (DataBaseMember object) => object.id,
        setId: (DataBaseMember object, int id) {
          object.id = id;
        },
        objectToFB: (DataBaseMember object, fb.Builder fbb) {
          final pageNoOffset =
              object.pageNo == null ? null : fbb.writeString(object.pageNo!);
          final boothNoOffset =
              object.boothNo == null ? null : fbb.writeString(object.boothNo!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          final contactNoOffset = object.contactNo == null
              ? null
              : fbb.writeString(object.contactNo!);
          final designationOffset = object.designation == null
              ? null
              : fbb.writeString(object.designation!);
          final vidhansabhaOffset = object.vidhansabha == null
              ? null
              : fbb.writeString(object.vidhansabha!);
          final wardOffset =
              object.ward == null ? null : fbb.writeString(object.ward!);
          final shaktikendraOffset = object.shaktikendra == null
              ? null
              : fbb.writeString(object.shaktikendra!);
          final inchargeOffset = object.incharge == null
              ? null
              : fbb.writeString(object.incharge!);
          final inchargeMobileOffset = object.inchargeMobile == null
              ? null
              : fbb.writeString(object.inchargeMobile!);
          final vaccineStatusOffset = object.vaccineStatus == null
              ? null
              : fbb.writeString(object.vaccineStatus!);
          final shaktikendraMobileOffset = object.shaktikendraMobile == null
              ? null
              : fbb.writeString(object.shaktikendraMobile!);
          fbb.startTable(112);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(96, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(97, object.updatedAt?.millisecondsSinceEpoch);
          fbb.addOffset(98, pageNoOffset);
          fbb.addOffset(99, boothNoOffset);
          fbb.addOffset(100, nameOffset);
          fbb.addOffset(101, addressOffset);
          fbb.addOffset(102, contactNoOffset);
          fbb.addOffset(103, designationOffset);
          fbb.addOffset(104, vidhansabhaOffset);
          fbb.addOffset(105, wardOffset);
          fbb.addOffset(106, shaktikendraOffset);
          fbb.addOffset(107, inchargeOffset);
          fbb.addOffset(108, inchargeMobileOffset);
          fbb.addOffset(109, vaccineStatusOffset);
          fbb.addOffset(110, shaktikendraMobileOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 196);
          final updatedAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 198);
          final object = DataBaseMember()
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4)
            ..createdAt = createdAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(createdAtValue)
            ..updatedAt = updatedAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(updatedAtValue)
            ..pageNo = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 200)
            ..boothNo = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 202)
            ..name = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 204)
            ..address = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 206)
            ..contactNo = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 208)
            ..designation = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 210)
            ..vidhansabha = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 212)
            ..ward = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 214)
            ..shaktikendra = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 216)
            ..incharge = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 218)
            ..inchargeMobile = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 220)
            ..vaccineStatus = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 222)
            ..shaktikendraMobile = const fb.StringReader()
                .vTableGetNullable(buffer, rootOffset, 224);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [DataBaseMember] entity fields to define ObjectBox queries.
class DataBaseMember_ {
  /// see [DataBaseMember.id]
  static final id =
      QueryIntegerProperty<DataBaseMember>(_entities[0].properties[0]);

  /// see [DataBaseMember.createdAt]
  static final createdAt =
      QueryIntegerProperty<DataBaseMember>(_entities[0].properties[1]);

  /// see [DataBaseMember.updatedAt]
  static final updatedAt =
      QueryIntegerProperty<DataBaseMember>(_entities[0].properties[2]);

  /// see [DataBaseMember.pageNo]
  static final pageNo =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[3]);

  /// see [DataBaseMember.boothNo]
  static final boothNo =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[4]);

  /// see [DataBaseMember.name]
  static final name =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[5]);

  /// see [DataBaseMember.address]
  static final address =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[6]);

  /// see [DataBaseMember.contactNo]
  static final contactNo =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[7]);

  /// see [DataBaseMember.designation]
  static final designation =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[8]);

  /// see [DataBaseMember.vidhansabha]
  static final vidhansabha =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[9]);

  /// see [DataBaseMember.ward]
  static final ward =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[10]);

  /// see [DataBaseMember.shaktikendra]
  static final shaktikendra =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[11]);

  /// see [DataBaseMember.incharge]
  static final incharge =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[12]);

  /// see [DataBaseMember.inchargeMobile]
  static final inchargeMobile =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[13]);

  /// see [DataBaseMember.vaccineStatus]
  static final vaccineStatus =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[14]);

  /// see [DataBaseMember.shaktikendraMobile]
  static final shaktikendraMobile =
      QueryStringProperty<DataBaseMember>(_entities[0].properties[15]);
}
