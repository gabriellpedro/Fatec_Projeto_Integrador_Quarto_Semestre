class EcopontoModel {
  final int eid;
  final String name;
  final String materialList;
  final String latitude;
  final String longitude;
  final String street;
  final int placeNumber;
  final String neighborhood;
  final String city;
  final String state;
  final String cep;
  bool isSelected;

  EcopontoModel({
    required this.eid,
    required this.name,
    required this.materialList,
    required this.latitude,
    required this.longitude,
    required this.street,
    required this.placeNumber,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.cep,
    this.isSelected = false,
  });

  EcopontoModel copyWith({
    int? eid,
    String? name,
    String? materialList,
    String? latitude,
    String? longitude,
    String? street,
    int? placeNumber,
    String? neighborhood,
    String? city,
    String? state,
    String? cep,
  }) {
    return EcopontoModel(
      eid: eid ?? this.eid,
      name: name ?? this.name,
      materialList: materialList ?? this.materialList,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      street: street ?? this.street,
      placeNumber: placeNumber ?? this.placeNumber,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      cep: cep ?? this.cep,
    );
  }

  factory EcopontoModel.fromJson(Map<String, dynamic> json) {
    return EcopontoModel(
      eid: json['eid'] ?? 0,
      name: json['name'] ?? '',
      materialList: json['material_list'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      street: json['street'] ?? '',
      placeNumber: json['place_number'] ?? 0,
      neighborhood: json['neighborhood'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      cep: json['cep'] ?? '',
    );
  }
}
