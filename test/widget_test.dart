import 'package:flutter_test/flutter_test.dart';
import 'package:carhub/app.dart';

void main() {
  testWidgets('CarHub app test', (WidgetTester tester) async {
    await tester.pumpWidget(const CarHubApp());

    expect(find.byType(CarHubApp), findsOneWidget);
  });
}