
class RecycleBalanceModel {
  String? name;
  num? mesure;
  num? price;
  num? mesureUnity;
  String? image;

  RecycleBalanceModel(
    {this.name,
    this.mesure,
    this.price,
    this.mesureUnity});

  RecycleBalanceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mesure = json['mesure'];
    price = json['price'];
    mesureUnity = json['mesure_unity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mesure'] = mesure;
    data['price'] = price;
    data['mesureUnity'] = mesureUnity;
    data['image'] = image;
    return data;
  }
}
