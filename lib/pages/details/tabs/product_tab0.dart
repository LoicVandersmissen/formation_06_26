import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_theme.dart';

class ProductTab0 extends StatelessWidget {
  const ProductTab0({super.key});

  static const double kImageHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          top: 0.0,
          start: 0.0,
          end: 0.0,
          height: kImageHeight,
          child: _ProductImage(),
        ),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: kImageHeight - _ProductBody._radius,
          bottom: 0.0,
          child: _ProductBody(),
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      fit: .cover,
      cacheWidth: MediaQuery.widthOf(context).toInt(),
    );
  }
}

class _ProductBody extends StatelessWidget {
  const _ProductBody();

  static const double _radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_radius)),
      ),
      padding: EdgeInsetsDirectional.only(
        top: 30.0,
        start: 20.0,
        end: 20.0,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Petits pois et carottes',
            style: Theme.of(context).extension<OffThemeExtension>()!.title1,
          ),
          Text('Cassegrain'),
        ],
      ),
    );
  }
}
