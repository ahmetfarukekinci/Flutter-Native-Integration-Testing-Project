class Character {
  final int id;
  final String name;
  final String species;
  final String gender;
  final String status;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.status,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'species': String species,
        'status': String status,
        'gender': String gender,
        'image': String image,
      } =>
        Character(
            id: id,
            name: name,
            species: species,
            gender: gender,
            status: status,
            image: image),
      _ => throw const FormatException("Failed to download character info!")
    };
  }
}
