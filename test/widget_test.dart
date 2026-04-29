import 'package:flutter_test/flutter_test.dart';
import 'package:week4_exercises/main.dart';

void main() {
  testWidgets('Home screen shows all exercises', (tester) async {
    await tester.pumpWidget(const Week4ExercisesApp());

    expect(find.text('Week 4 Flutter Exercises'), findsOneWidget);
    expect(find.text('1. List View Exercise'), findsOneWidget);
    expect(find.text('2. Grid View Exercise'), findsOneWidget);
    expect(find.text('3. Shared Preferences Exercise'), findsOneWidget);
    expect(find.text('4. Async Programming Exercise'), findsOneWidget);
  });
}
