import 'dart:convert';

class Provinces {
  String? name;
  String? image;
  Provinces({
    this.name,
    this.image,
  });

  Provinces copyWith({
    String? name,
    String? image,
  }) {
    return Provinces(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory Provinces.fromMap(Map<String, dynamic> map) {
    return Provinces(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Provinces.fromJson(String source) => Provinces.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Categories(name: $name, image: $image)';

  @override
  bool operator ==(covariant Provinces other) {
    if (identical(this, other)) return true;

    return
      other.name == name &&
          other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
