import 'package:flutter/widgets.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/products/state/products_page_state.dart';

/// An [InheritedWidget] that exposes a [T] object.
class InheritedObject<T> extends InheritedWidget {
  /// The object exposed to the sub-tree.
  final T object;

  /// Creates an [InheritedWidget] that exposes a [T] object.
  const InheritedObject({
    required this.object,
    required super.child,
    super.key,
  });

  /// Retrieves the closest [InheritedObject] instance up in the tree and
  /// returns `null` in case [InheritedObject] is not found.
  static InheritedObject<T>? maybeOf<T>(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<InheritedObject<T>>();
    } on Exception {
      return null;
    }
  }

  /// Retrieves the closest [InheritedObject] instance up in the tree.
  static InheritedObject<T> of<T>(BuildContext context) {
    final widget = maybeOf<T>(context);
    assert(widget != null, "No 'InheritedObject' found above in the tree.");

    return widget!;
  }

  @override
  bool updateShouldNotify(covariant InheritedObject<T> oldWidget) {
    return object != oldWidget.object;
  }
}

/// Extension method on [BuildContext] that allows getting a reference to the
///[FometMockClient] up in the tree using [InheritedObject].
extension InheritedObjectClientExt on BuildContext {
  /// Uses [InheritedObject] to retrieve a [FometMockClient] object.
  FometMockClient? get mockClient =>
      InheritedObject.maybeOf<FometMockClient>(this)?.object;
}

/// Extension method on [BuildContext] that allows getting a reference to the
///[ProductsPageState] up in the tree using [InheritedObject].
extension InheritedProductsStateExt on BuildContext {
  /// Uses [InheritedObject] to retrieve a [ProductsPageState] object.
  ProductsPageState get productsPageState =>
      InheritedObject.of<ProductsPageState>(this).object;
}
