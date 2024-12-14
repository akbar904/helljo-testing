
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/animal_cubit.dart';
import '../models/animal_model.dart';

class AnimalTextWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final animalCubit = context.watch<AnimalCubit>();
		final animal = animalCubit.state;

		return GestureDetector(
			onTap: () {
				animalCubit.toggleAnimal();
			},
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Text(animal.name),
					SizedBox(width: 8),
					Icon(animal.icon),
				],
			),
		);
	}
}
