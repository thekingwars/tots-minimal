import 'package:flutter_test/flutter_test.dart';
import 'package:tots_test_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ClientServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
