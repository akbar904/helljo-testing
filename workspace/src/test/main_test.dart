
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animal_app/main.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('MyApp', () {
		testWidgets('displays HomeScreen widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		blocTest<AnimalCubit, Animal>(
			'emits [Dog] when toggleAnimal is called on Cat state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [isA<Animal>().having((animal) => animal.name, 'name', 'Dog')],
		);

		blocTest<AnimalCubit, Animal>(
			'emits [Cat] when toggleAnimal is called on Dog state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [isA<Animal>().having((animal) => animal.name, 'name', 'Cat')],
		);
	});
}
