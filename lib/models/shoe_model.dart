import 'package:hive/hive.dart';
part 'shoe_model.g.dart';

@HiveType(typeId: 1)
class ShoeModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final String image;

  @HiveField(4)
  int? id;

  ShoeModel({
    required this.name,
    required this.price,
    required this.desc,
    required this.image,
    this.id
  });
}
