class Ingredient {
  String name;
  String image;
  String description;

  Ingredient({this.name, this.image, this.description});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
