import 'package:flutter/material.dart';
import 'package:formation_flutter/pages/details/tabs/product_tab0.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox.expand(child: ProductTab0()));
  }
}
