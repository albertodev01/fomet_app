import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';

/// An [InheritedWidget] that exposes a [CatalogPageState] object.
class InheritedCatalogState extends InheritedWidget {
  /// The state of the catalog page.
  final CatalogPageState catalogState;

  /// Creates an [InheritedWidget] that exposes a [CatalogPageState] object.
  const InheritedCatalogState({
    required this.catalogState,
    required super.child,
    super.key,
  });

  /// Retrieves the closest [InheritedCatalogState] instance up in the tree.
  static InheritedCatalogState of(BuildContext context) {
    final ref =
        context.dependOnInheritedWidgetOfExactType<InheritedCatalogState>();
    assert(ref != null, "No 'InheritedCatalogState' found above in the tree.");

    return ref!;
  }

  @override
  bool updateShouldNotify(covariant InheritedCatalogState oldWidget) {
    return catalogState != oldWidget.catalogState;
  }
}

/// Extension method on [BuildContext] that allows getting a reference to the
///[CatalogPageState] up in the tree using [InheritedCatalogState].
extension InheritedPolynomialExt on BuildContext {
  /// Uses [InheritedCatalogState] to retrieve a [CatalogPageState] object.
  CatalogPageState get catalogState =>
      InheritedCatalogState.of(this).catalogState;
}
