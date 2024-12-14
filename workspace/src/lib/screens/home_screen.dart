
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/animal_cubit.dart';
import '../widgets/animal_text_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Simple Animal App')),
			body: Center(
				child: BlocProvider(
					create: (context) => AnimalCubit(),
					child: AnimalTextWidget(),
				),
			),
		);
	}
}
