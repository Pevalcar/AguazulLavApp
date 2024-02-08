import 'package:flutter/material.dart';

class SliverTitleDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  //toolBarHeight Included in both
  double alturaCerrado;
  double alturaAbierto;
  Color? color;
  SliverTitleDelegate({
    required this.child,
    this.toolBarHeight = 0.0,
    this.alturaCerrado = 0.0,
    this.alturaAbierto = 0.0,
    this.color ,
  });

  Widget child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: (toolBarHeight) + (alturaAbierto),
      color:  color ?? Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FittedBox(
              fit: BoxFit.contain,
              child: child,
            )),
      ),
    );
  }
  @override
  // TODO: implement maxExtent
  double get maxExtent => toolBarHeight + alturaAbierto;

  @override
  // TODO: implement minExtent
  double get minExtent => toolBarHeight + alturaCerrado;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
