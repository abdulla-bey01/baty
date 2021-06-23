import 'package:hive/hive.dart';

mixin BaseModel {
  @HiveField(0)
  dynamic id;
}
