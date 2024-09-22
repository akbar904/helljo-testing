
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_package_name/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubit Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('Initial state is Animal(name: "Cat", icon: Icons.access_time)', () {
			expect(animalCubit.state, Animal(name: 'Cat', icon: Icons.access_time));
		});

		blocTest<AnimalCubit, Animal>(
			'emits [Animal(name: "Dog", icon: Icons.person)] when toggleAnimal is called on initial state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, Animal>(
			'emits [Animal(name: "Cat", icon: Icons.access_time)] when toggleAnimal is called on Dog state',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal(); // First toggle to Dog
				cubit.toggleAnimal(); // Toggle back to Cat
			},
			expect: () => [
				Animal(name: 'Dog', icon: Icons.person),
				Animal(name: 'Cat', icon: Icons.access_time),
			],
		);
	});
}
