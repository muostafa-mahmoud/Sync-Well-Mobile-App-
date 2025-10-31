import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 1)
class MealsSection extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String image;

  @HiveField(2)
  String imageType;

  @HiveField(3)
  String title;

  @HiveField(4)
  int readyInMinutes;

  @HiveField(5)
  int servings;

  @HiveField(6)
  String sourceUrl;

  MealsSection({
    required this.id,
    required this.image,
    required this.imageType,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  });

  factory MealsSection.fromJson(Map<String, dynamic> json) => MealsSection(
    id: json['id'] ?? 0,
    image: json['image'] ?? '',
    imageType: json['imageType'] ?? '',
    title: json['title'] ?? '',
    readyInMinutes: json['readyInMinutes'] ?? 0,
    servings: json['servings'] ?? 0,
    sourceUrl: json['sourceUrl'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'imageType': imageType,
    'title': title,
    'readyInMinutes': readyInMinutes,
    'servings': servings,
    'sourceUrl': sourceUrl,
  };
}
