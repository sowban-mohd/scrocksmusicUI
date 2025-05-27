class ServiceCardModel {
  final String name;
  final String description;
  final String iconPath;
  final String backgroundImagePath;

  ServiceCardModel({
    required this.name,
    required this.description,
    required this.iconPath,
    required this.backgroundImagePath
  });

  factory ServiceCardModel.fromMap(Map<String, dynamic> map) {
    return ServiceCardModel(
      name: map['name'],
      description: map['description'],
      iconPath: map['iconurl'],
      backgroundImagePath: map['bgimgurl']
    );
  }
}
