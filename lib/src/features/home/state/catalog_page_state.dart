import 'package:flutter/foundation.dart';
import 'package:fomet_api_client/fomet_api_client.dart';

final class CatalogPageState extends ChangeNotifier {
  var _category = const (code: '', description: '');
  var _variety = const (code: '', description: '');
  var _kind = const (code: '', description: '');
  var _product = const (code: '', description: '');

  FometCatalogItem get category => _category;
  FometCatalogItem get variety => _variety;
  FometCatalogItem get kind => _kind;
  FometCatalogItem get product => _product;

  set category(FometCatalogItem value) {
    if (value != _category) {
      _category = value;
      notifyListeners();
    }
  }

  set variety(FometCatalogItem value) {
    if (value != _variety) {
      _variety = value;
      notifyListeners();
    }
  }

  set kind(FometCatalogItem value) {
    if (value != _kind) {
      _kind = value;
      notifyListeners();
    }
  }

  set product(FometCatalogItem value) {
    if (value != _product) {
      _product = value;
      notifyListeners();
    }
  }

  void clear() {
    _category = const (code: '', description: '');
    _variety = const (code: '', description: '');
    _kind = const (code: '', description: '');
    _product = const (code: '', description: '');

    notifyListeners();
  }
}
