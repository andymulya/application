import 'package:application/providers/button_custom_provider.dart';
import 'package:application/views/pages/surah_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonCustomWidget extends StatelessWidget{
	const ButtonCustomWidget({super.key});

	@override 
	Widget build(BuildContext context){
		final buttonColor = Provider.of<ButtonCustomProvider>(context);
		return GestureDetector(
			onTap: (){
				Navigator.pushReplacementNamed(context, SurahListPage.routeName);
			},
			onTapDown: (details){
				buttonColor.isTap = !buttonColor.isTap;
			},
			onTapUp: (details){
				buttonColor.isTap = !buttonColor.isTap;
			},
			onTapCancel: (){
				buttonColor.isTap = !buttonColor.isTap;
			},
			child: Container(
			  	margin: const EdgeInsets.symmetric(horizontal: 20),
			  	height: 50,
			  	width: MediaQuery.of(context).size.width * 0.5,
			  	decoration: BoxDecoration(
			  		borderRadius: BorderRadius.circular(20),
			  		color: buttonColor.color,
			  		boxShadow: [
			  			BoxShadow(
			  				color: Colors.black.withOpacity(0.3),
			  				offset: const Offset(1, -1),
			  				blurRadius: 1,
			  				spreadRadius: 0,
			  			),

			  			BoxShadow(
			  				color: Colors.black.withOpacity(0.3),
			  				offset: const Offset(1, -1),
			  				blurRadius: 1,
			  				spreadRadius: 0,
			  			),
			  		],
			  	),
			  	child: Center(
			  		child: Text('Lanjutkan', 
			  			style: GoogleFonts.mallanna(
			  				color: Colors.white,
			  				fontWeight: FontWeight.bold,
			  				fontSize: 16,
			  			),
			  		),
			  	),
			),
		);
	}
}