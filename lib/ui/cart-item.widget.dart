import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class CartItemWidget extends StatefulWidget {
  final String pizzaUrl;
  final String pizzaTitle;
  final double pizzaPrice;

  const CartItemWidget(this.pizzaUrl, this.pizzaTitle, this.pizzaPrice,
      {super.key});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  double subTotal = 0.0;
  int qtt = 1;

  @override
  void initState() {
    super.initState();
    updateSubTotal();
  }

  void updateSubTotal() {
    setState(() {
      subTotal = widget.pizzaPrice * qtt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/pizza/${widget.pizzaUrl}',
                height: 120,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Pizza ${widget.pizzaTitle}',
                      style: PizzeriaStyle.headerTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.pizzaPrice} €"),
                          InputQty(
                            maxVal: 100,
                            initVal: 1,
                            minVal: 0,
                            steps: 1,
                            decoration:
                                QtyDecorationProps(btnColor: Colors.indigo),
                            onQtyChanged: (val) {
                              qtt = val;
                              updateSubTotal();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sous-total : ${subTotal.toStringAsFixed(2)} €",
                      style: PizzeriaStyle.priceTotalTextStyle,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
