import 'package:flutter/material.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/pages/details/product_loader.dart';
import 'package:formation_flutter/pages/details/tabs/product_tab0.dart';
import 'package:formation_flutter/pages/details/tabs/product_tab1.dart';
import 'package:formation_flutter/pages/details/tabs/product_tab2.dart';
import 'package:formation_flutter/pages/details/tabs/product_tab3.dart';
import 'package:formation_flutter/res/app_icons.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductPageTabs _currentTab = ProductPageTabs.values.first;

  @override
  Widget build(BuildContext context) {
    return ProductIW(
      product: generateProduct(),
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Offstage(
                offstage: _currentTab != ProductPageTabs.summary,
                child: const ProductTab0(),
              ),
              Offstage(
                offstage: _currentTab != ProductPageTabs.info,
                child: const ProductTab1(),
              ),
              Offstage(
                offstage: _currentTab != ProductPageTabs.nutrition,
                child: const ProductTab2(),
              ),
              Offstage(
                offstage: _currentTab != ProductPageTabs.nutritionalValues,
                child: const ProductTab3(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab.index,
          onTap: (int position) {
            _currentTab = ProductPageTabs.values[position];
            setState(() {});
          },
          items: ProductPageTabs.values
              .map(
                (ProductPageTabs tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label(AppLocalizations.of(context)!),
                ),
              )
              .toList(growable: false),
        ),
      ),
    );
  }
}

enum ProductPageTabs {
  summary(AppIcons.tab_barcode),
  info(AppIcons.tab_fridge),
  nutrition(AppIcons.tab_nutrition),
  nutritionalValues(AppIcons.tab_array);

  const ProductPageTabs(this.icon);

  final IconData icon;

  String label(AppLocalizations appLocalizations) => switch (this) {
    ProductPageTabs.summary => appLocalizations.product_tab_summary,
    ProductPageTabs.info => appLocalizations.product_tab_properties,
    ProductPageTabs.nutrition => appLocalizations.product_tab_nutrition,
    ProductPageTabs.nutritionalValues =>
      appLocalizations.product_tab_nutrition_facts,
  };
}
