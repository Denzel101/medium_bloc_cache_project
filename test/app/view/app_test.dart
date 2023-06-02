import 'package:flutter_test/flutter_test.dart';
import 'package:medium_bloc_cache_project/app/app.dart';
import 'package:medium_bloc_cache_project/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
