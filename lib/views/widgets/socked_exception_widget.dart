import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SockedExceptionWidget extends StatelessWidget{
	const SockedExceptionWidget({super.key});

	@override
	Widget build(BuildContext context){
		return Center(
			child: SizedBox(
				height: 250,
				width: 250,
				child: Lottie.asset('assets/lottie/no-internet.json'),
			),
		);
	}
}