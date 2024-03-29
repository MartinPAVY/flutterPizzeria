import 'package:flutter/material.dart';
import 'package:pizzeria/models/option_item.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:pizzeria/ui/share/appBar_widget.dart';
import 'package:pizzeria/ui/share/buy_button_widget.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:pizzeria/ui/share/total_widget.dart';

import '../models/cart.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;
  final Cart _cart;

  PizzaDetails(this._pizza, this._cart, {Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(widget._pizza.title, widget._cart),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          Text(
            'Pizza ${widget._pizza.title}',
            style: PizzeriaStyle.pageTitleTextStyle,
          ),
          Image.network(
            '${widget._pizza.image}',
            height: 180,
          ),
          Text('Recette', style: PizzeriaStyle.headerTextStyle),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12),
            child: Text(widget._pizza.garniture),
          ),
          Text('Pâte et taille sélectionnées',
              style: PizzeriaStyle.headerTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildDropDownPates()),
              Expanded(child: _buildDropDownTailles()),
            ],
          ),
          Text('Sauces sélectionnées', style: PizzeriaStyle.headerTextStyle),
          /*Text('Les sauces'),
          Text('${widget._pizza.price} €'),*/
          _buildDropDownSauces(),
          TotalWidget(widget._pizza.total),
          BuyButtonWidget(widget._pizza, widget._cart),
        ],
      ),
    );
  }

  _buildDropDownPates() {
    return DropdownButton<OptionItem>(
        isExpanded: true,
        value: Pizza.pates[widget._pizza.pate],
        items: _buildDropDownItem(Pizza.pates),
        onChanged: (item) {
          setState(() {
            widget._pizza.pate = item!.value;
          });
        });
  }

  _buildDropDownTailles() {
    return DropdownButton<OptionItem>(
        isExpanded: true,
        value: Pizza.tailles[widget._pizza.taille],
        items: _buildDropDownItem(Pizza.tailles),
        onChanged: (item) {
          setState(() {
            widget._pizza.taille = item!.value;
          });
        });
  }

  _buildDropDownSauces() {
    return DropdownButton<OptionItem>(
        isExpanded: true,
        value: Pizza.sauces[widget._pizza.sauce],
        items: _buildDropDownItem(Pizza.sauces),
        onChanged: (item) {
          setState(() {
            widget._pizza.sauce = item!.value;
          });
        });
  }

  _buildDropDownItem(List<OptionItem> list) {
    return Iterable.generate(
        list.length,
        (i) => DropdownMenuItem<OptionItem>(
              value: list[i],
              child: Text(list[i].name),
            )).toList();
  }
}
