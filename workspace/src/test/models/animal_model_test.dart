
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_animal_app/models/animal_model.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should correctly serialize and deserialize', () {
			// Arrange
			final animal = Animal(name: 'Cat', icon: Icons.access_time);

			// Act
			final json = animal.toJson();
			final deserializedAnimal = Animal.fromJson(json);

			// Assert
			expect(deserializedAnimal.name, animal.name);
			expect(deserializedAnimal.icon, animal.icon);
		});

		test('Animal model should have correct initial values', () {
			// Arrange & Act
			final animal = Animal(name: 'Cat', icon: Icons.access_time);

			// Assert
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.access_time);
		});
	});
}

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});

	Map<String, dynamic> toJson() => {
		'name': name,
		'icon': icon.codePoint,
	};

	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			name: json['name'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
