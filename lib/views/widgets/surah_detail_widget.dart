import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahDetailWidget extends StatelessWidget{
	final int numberOfAyah;
	final String ar, id;

	const SurahDetailWidget({
		required this.numberOfAyah,
		required this.ar,
		required this.id,
		super.key
	});

	@override
	Widget build(BuildContext context){
		return Container(
			padding: const EdgeInsets.all(10),
			margin: const EdgeInsets.only(bottom: 5),
			width: double.infinity,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: [

					// Nomer Ayat dan Surah
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Container(
								margin: const EdgeInsets.all(10),
								height: 50,
								width: 50,
								decoration: const BoxDecoration(
									shape: BoxShape.circle,
									image: DecorationImage(
										image: AssetImage('assets/images/islamic.png'),
									),
								),
								child: Center(
									child: Text(
										numberOfAyah.toString(),
										style: TextStyle(
											fontSize: 16,
											fontWeight: FontWeight.bold,
											color: Colors.black.withOpacity(0.6)
										),
									),
								),
							),
							Expanded(
								child: Container(
									margin: const EdgeInsets.only(top: 10, bottom: 10),
								  child: Text(
								    	ar, 
								    	textAlign: TextAlign.end,
								    	style: GoogleFonts.manuale(
								    		fontSize: 20,
								    	),
								  ),
								),
							),
						],
					),

					//Text Indonesia
					Container(
						margin: const EdgeInsets.only(left: 10,top: 10),
						alignment: Alignment.topLeft,
						width: double.infinity,
						child: Text(id),
					),
				],
			),
		);
	}

}