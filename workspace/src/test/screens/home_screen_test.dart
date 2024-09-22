
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animal_app/screens/home_screen.dart';

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays initial animal as Cat with clock icon', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles animal to Dog with person icon when clicked', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
