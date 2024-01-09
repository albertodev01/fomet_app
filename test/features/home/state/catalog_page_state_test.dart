import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/home/state/catalog_page_state.dart';

void main() {
  group('CatalogPageState', () {
    const emptyValue = (code: '', description: '');

    test('Smoke test', () {
      final state = CatalogPageState();

      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
    });

    test('Listeners test', () {
      var count = 0;
      final state = CatalogPageState()..addListener(() => ++count);

      // Initial state
      expect(count, isZero);

      state.category = const (code: 'code', description: 'desc');
      expect(count, equals(1));

      state.variety = const (code: 'code', description: 'desc');
      expect(count, equals(2));

      state.kind = const (code: 'code', description: 'desc');
      expect(count, equals(3));

      state.product = const (code: 'code', description: 'desc');
      expect(count, equals(4));

      state.clear();
      expect(count, equals(5));
      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
      expect(state.category, equals(emptyValue));
    });
  });
}
