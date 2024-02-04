import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/cart-item.widget.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
              child: CartItemWidget(
            "pizza-bbq.jpg",
            "Barbecue",
            6.5,
          )),
          Table(
            columnWidths: {
              0: FlexColumnWidth(1.0), // Left column
              1: FlexColumnWidth(1.0), // Center column
              2: FlexColumnWidth(0.5), // Right column
            },
            children: [
              TableRow(
                children: [
                  Container(), // Empty cell in the left column
                  Container(), // Empty cell in the center column
                  Container(), // Empty cell in the right column
                ],
              ),
              TableRow(
                children: [
                  Container(), // Empty cell in the left column
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL HT",
                      style: PizzeriaStyle.itemPriceTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "23.60 €",
                      style: PizzeriaStyle.itemPriceTextStyle,
                    ), // Replace with your actual value
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(), // Empty cell in the left column
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TVA",
                      style: PizzeriaStyle.pageTitleTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "5.90 €",
                      style: PizzeriaStyle.itemPriceTextStyle,
                    ), // Replace with your actual value
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL TTC",
                      style: PizzeriaStyle.itemPriceTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "29.50 €",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ), // Replace with your actual value
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            // Adjust the value as needed
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Valider',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print('Valider le panier');
              },
            ),
          ),
        ],
      ),
    );
  }
}
