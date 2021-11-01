import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  final String name;

  final String image;
  final String valor;
  final Function() function;
  const CatalogCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.valor,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Card(
          child: Column(
        children: [Text(name), Image.network(image), Text(valor)],
      )),
    );
  }
}
