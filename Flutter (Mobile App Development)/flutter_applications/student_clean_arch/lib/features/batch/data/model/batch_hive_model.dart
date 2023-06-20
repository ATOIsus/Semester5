import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'batch_hive_model.g.dart'; //generates adapter. To deal with byte data in Hive.
// dart run build_runner build --delete-conflicting-outputs

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;

  @HiveField(1)
  final String? batchName;

  BatchHiveModel.empty() : this(batchId: '', batchName: '');

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  @override
  String toString() {
    return 'batchId: $batchId, batchNam: $batchName';
  }
}
