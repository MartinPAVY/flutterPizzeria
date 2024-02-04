import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/menu.dart';
import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appBar_widget.dart';

void main() {
  runApp(MyPage());
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: MyHomePage(
        title: 'Notre pizzéria',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;

  MyHomePage({required this.title, Key? key})
      : _cart = Cart(),
        super(key: key);

  var _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreenAccent),
    Menu(2, 'Pizzas', 'pizza.png', Colors.lightGreenAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.lightGreenAccent),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightGreenAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PizzaList(_cart)),
                  );
                  break;
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
        ),
      ),
    );
  }
}

_buildRow(Menu menu) {
  return Container(
      height: 180,
      decoration: BoxDecoration(
          color: menu.color,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              '${menu.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
              height: 50,
              child: Center(
                child: Text(
                  menu.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                    fontSize: 28,
                  ),
                ),
              ))
        ],
      ));
}
