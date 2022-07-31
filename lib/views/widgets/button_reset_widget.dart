import 'package:flutter/material.dart';

class ButtonResetWidget extends StatelessWidget{
	final BoxConstraints constraints;
	final Function()? onTap;

	const ButtonResetWidget({required this.constraints, required this.onTap, super.key});

	@override
	Widget build(BuildContext context){
		return GestureDetector(
			onTap: onTap,
			child: Container(
			    	margin: const EdgeInsets.symmetric(horizontal: 20),
			    	width: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.15 : 
			    	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.1 : constraints.maxWidth * 0.1,

			    	height: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.15 : 
			    	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.1 : constraints.maxWidth * 0.1,
			    	decoration: BoxDecoration(
			    		color: const Color(0xFFff4800),
			    		borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 1),
			    		boxShadow: <BoxShadow>[
			    			BoxShadow(
			    				color: Colors.black.withOpacity(0.5),
			    				blurRadius: 0.5,
			    				spreadRadius: 0.7,
			    				offset: const Offset(1, -1),
			    			),
			    		]
			    	),
			    	child: const Center(
			    		child: Text('reset', 
		    		    	style: TextStyle(
		    		    		color: Colors.white,
		    		    		fontSize: 16,
		    		    		fontWeight: FontWeight.bold,
		    		    	),
			    		),
			    	),
			),
		);
	}
}