import 'package:hive/hive.dart';

part 'local_site.g.dart'; //flutter packages pub run build_runner build

@HiveType(typeId: 0)
class LocalSite extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? otrainfo;

  @HiveField(4)
  String? ciudad;

  @HiveField(5)
  String? rating;

  @HiveField(6)
  String? urlPicture; //imageLink

}
