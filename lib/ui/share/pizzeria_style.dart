import 'package:flutter/material.dart';

class PizzeriaStyle {
  static final baseTextStyle = TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20,
  );
  static final TextStyle regularTextStyle = baseTextStyle.copyWith(
    fontSize: 18,
  );

  static final TextStyle subHeaderTextStyle = baseTextStyle.copyWith(
    fontSize: 26,
  );

  static final TextStyle itemPriceTextStyle = baseTextStyle.copyWith(
    color: Colors.grey,
    fontSize: 20,
  );

  static final TextStyle priceSubTextStyle = baseTextStyle.copyWith(
    color: Colors.grey,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle priceTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 22,
  );

  static final TextStyle errorTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22,
  );
}
