import 'package:flutter/foundation.dart';
import 'package:fomet_api_client/fomet_api_client.dart';

final class CatalogPageState extends ChangeNotifier {
  var _category = const (code: '', description: '');
  var _variety = const (code: '', description: '');
  var _kind = const (code: '', description: '');

  FometCatalogItem get category => _category;
  FometCatalogItem get variety => _variety;
  FometCatalogItem get kind => _kind;

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

  bool get hasCategory =>
      _category.code.isNotEmpty && _category.description.isNotEmpty;
  bool get hasVariety =>
      _variety.code.isNotEmpty && _variety.description.isNotEmpty;
  bool get hasKind => _kind.code.isNotEmpty && _kind.description.isNotEmpty;

  void clear() {
    _category = const (code: '', description: '');
    _variety = const (code: '', description: '');
    _kind = const (code: '', description: '');

    notifyListeners();
  }
}
