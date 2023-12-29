import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/products/state/products_page_state.dart';

class InheritedProductsState extends InheritedWidget {
  final ProductsPageState productsPageState;

  const InheritedProductsState({
    required this.productsPageState,
    required super.child,
    super.key,
  });

  static InheritedProductsState of(BuildContext context) {
    final ref =
        context.dependOnInheritedWidgetOfExactType<InheritedProductsState>();
    assert(ref != null, "No 'InheritedProductsState' found above in the tree.");

    return ref!;
  }

  @override
  bool updateShouldNotify(covariant InheritedProductsState oldWidget) {
    return productsPageState != oldWidget.productsPageState;
  }
}

extension InheritedProductsStateExt on BuildContext {
  ProductsPageState get productsPageState =>
      InheritedProductsState.of(this).productsPageState;
}
