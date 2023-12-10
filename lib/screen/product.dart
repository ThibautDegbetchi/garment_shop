import 'package:flutter/cupertino.dart';

class ProductPage extends StatefulWidget {
  final String name;
  final  String url;
  final double  price;
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
