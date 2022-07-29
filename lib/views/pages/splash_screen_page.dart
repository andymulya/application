import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'surah_list_page.dart';

class SplashScreen extends StatefulWidget{
	static const routeName = '/splashScreen';

	const SplashScreen({super.key});

	@override
	State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

	@override
	  void initState() {

	  	Future.delayed(const Duration(seconds: 10),(){
	  		Navigator.pushReplacementNamed(context, SurahListPage.routeName);
	  	});

	    super.initState();
	  }

	@override
	Widget build(BuildContext context){

		return Scaffold(
			body: Stack(
				children: [
					Container(
						width: MediaQuery.of(context).size.width * 1,
						height: MediaQuery.of(context).size.height * 0.7,
						decoration: BoxDecoration(
							color: const Color(0xFF00a3ad),
							image: const DecorationImage(
								image: AssetImage('assets/images/star.png'),
							),
							borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height * 0.7)) 
						),
					),

					Center(
						child: Lottie.asset('assets/lottie/muslim.json', width: 400, height: 350),
					),
				],
			),
		);
	}
}