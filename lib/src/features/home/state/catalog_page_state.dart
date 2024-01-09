import 'package:flutter/foundation.dart';
import 'package:fomet_api_client/fomet_api_client.dart';
import 'package:fomet_app/src/features/home/pages/catalog_page.dart';

/// State class of the [CatalogPage] widget that holds infromation about the
/// selected items in the catalog.
final class CatalogPageState extends ChangeNotifier {
  var _category = const (code: '', description: '');
  var _variety = const (code: '', description: '');
  var _kind = const (code: '', description: '');
  var _product = const (code: '', description: '');

  /// The selected category.
  FometCatalogItem get category => _category;

  /// The selected variety.
  FometCatalogItem get variety => _variety;

  /// The selected product kind.
  FometCatalogItem get kind => _kind;

  /// The selected product code.
  FometCatalogItem get product => _product;

  /// Sets [category] and notifies any listeners if [value] is different from
  /// the current value.
  set category(FometCatalogItem value) {
    if (value != _category) {
      _category = value;
      notifyListeners();
    }
  }

  /// Sets [variety] and notifies any listeners if [value] is different from
  /// the current value.
  set variety(FometCatalogItem value) {
    if (value != _variety) {
      _variety = value;
      notifyListeners();
    }
  }

  /// Sets [kind] and notifies any listeners if [value] is different from the
  /// current value.
  set kind(FometCatalogItem value) {
    if (value != _kind) {
      _kind = value;
      notifyListeners();
    }
  }

  /// Sets [product] and notifies any listeners if [value] is different from
  /// the current value.
  set product(FometCatalogItem value) {
    if (value != _product) {
      _product = value;
      notifyListeners();
    }
  }

  /// Clears the state and notifies listeners.
  void clear() {
    _category = const (code: '', description: '');
    _variety = const (code: '', description: '');
    _kind = const (code: '', description: '');
    _product = const (code: '', description: '');

    notifyListeners();
  }
}
