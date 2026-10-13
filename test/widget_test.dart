import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('DePosylka app shows the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const DePosylkaApp());

    expect(find.text('ДеПосилка'), findsOneWidget);
    expect(find.text('Увійти'), findsOneWidget);
  });
}
