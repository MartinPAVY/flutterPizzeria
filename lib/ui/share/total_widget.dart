import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class TotalWidget extends StatelessWidget {
  final double total;

  const TotalWidget(this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("####.00 €");
    String totalAffiche = format.format(total);

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 13),
              child: Text(
                'TOTAL',
                style: PizzeriaStyle.priceTotalTextStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Expanded(
              child: Text(
            totalAffiche,
            style: PizzeriaStyle.priceTotalTextStyle,
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
