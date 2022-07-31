import 'package:flutter/material.dart';

class ButtonCustomTasbihWidget extends StatelessWidget{
	final Function()? onTap;
	const ButtonCustomTasbihWidget({required this.onTap ,super.key});

	@override
	Widget build(BuildContext context){
		return GestureDetector(
			onTap: onTap,
			child: Container(
				margin: const EdgeInsets.all(10),
				width: 35,
				height: 35,
				decoration: const BoxDecoration(
					color: Color(0xFFeafffe),
					shape: BoxShape.circle,
					image: DecorationImage(
						image: AssetImage('assets/images/tasbih.png'),
					),
				),
			),
		);
	}
}