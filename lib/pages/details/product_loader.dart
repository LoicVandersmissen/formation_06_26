import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

class ProductIW extends InheritedWidget {
  const ProductIW({
    required this.product,
    required super.child,
    super.key,
  });

  final Product product;

  static ProductIW of(BuildContext context) {
    final ProductIW? result = context
        .dependOnInheritedWidgetOfExactType<ProductIW>();
    assert(result != null, 'No ProductIW found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductIW old) => product != old.product;
}

class ProductChangeNotifier with ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  Future<Product> load() async {
    await Future.delayed(const Duration(seconds: 5));
    _product = generateProduct();
    notifyListeners();
    return _product!;
  }
}
