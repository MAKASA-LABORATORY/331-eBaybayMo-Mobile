import 'package:flutter_test/flutter_test.dart';
import 'package:ebaybaymo/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SignInViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}