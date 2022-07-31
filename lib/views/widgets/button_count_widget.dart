import 'package:flutter/material.dart';

class ButtonCountWidget extends StatelessWidget{
	final BoxConstraints constraints;
	final Function()? onTap;

	const ButtonCountWidget({required this.constraints, required this.onTap, super.key});

	@override
	Widget build(BuildContext context){
		return GestureDetector(
			onTap: onTap,
			child: Container(
			    	margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
			    	width: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.4 : 
			    	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.2 : constraints.maxWidth * 0.2,

			    	height: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.4 : 
			    	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.2 : constraints.maxWidth * 0.2,
			    	decoration: BoxDecoration(
			    		color: const Color(0xFF0ebe00),
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
			    		child: FittedBox(
			    		  child: Text('Count', 
			    		    	style: TextStyle(
			    		    		color: Colors.white,
			    		    		fontSize: 16,
			    		    		fontWeight: FontWeight.bold,
			    		    	),
			    		  ),
			    		),
			    	),
			),
		);
	}
}