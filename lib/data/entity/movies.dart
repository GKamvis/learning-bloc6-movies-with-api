class Movies {
  int id;
  int price;
  String image;

  Movies({
    required this.id,
    required this.price,
    required this.image,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(id: json['id'],
     price: json['fiyat'],
     image: json['resim']);
  }

}
