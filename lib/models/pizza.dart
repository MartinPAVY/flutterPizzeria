import 'package:pizzeria/models/option_item.dart';

class Pizza {
  final int id;
  final String title;
  final String garniture;
  final String image;
  final double price;

  Pizza({
    required this.id,
    required this.title,
    required this.garniture,
    required this.image,
    required this.price,
  });
  
  int pate = 0;
  int taille = 1;
  int sauce = 0;

  double get total {
    double total = price;
    total += pates[pate].supplement;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;

    return total;
  }

  static final List<OptionItem> pates = [
    OptionItem(0, "Pâte fine"),
    OptionItem(1, "Pâte épaisse", supplement: 2),
  ];

  static final List<OptionItem> tailles = [
    OptionItem(0, "Small", supplement: -1),
    OptionItem(1, "Medium"),
    OptionItem(2, "Large", supplement: 2),
    OptionItem(3, "Extra Large", supplement: 4),
  ];
  static final List<OptionItem> sauces = [
    OptionItem(0, "Base sauce tomate"),
    OptionItem(1, "Sauce Samourai", supplement: 2),
  ];

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      title: json['title'],
      garniture: json['garniture'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }
}
