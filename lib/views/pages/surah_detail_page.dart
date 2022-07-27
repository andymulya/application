import 'package:application/providers/surah_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/surah_detail_widget.dart';

class SurahDetailPage extends StatelessWidget{
	static const routeName = '/surahDetailPage';

	const SurahDetailPage({super.key});

	@override
	Widget build(BuildContext context){
		final getDetailSurah = Provider.of<SurahDetailProvider>(context);
		
		return Scaffold(
			body: _ui(context, getDetailSurah),
		);
	}

	Widget _ui(BuildContext context ,SurahDetailProvider fetchData){
		if(fetchData.isLoading){
			return const Center(
				child: CircularProgressIndicator(),
			);
		}
		if(fetchData.errorMessage != null){
			return Text(fetchData.errorMessage.toString());
		}

		return Column(
			children: [
				//Button back
				SafeArea(
				  child: Container(
				  	alignment: Alignment.topLeft,
				  	color: const Color(0xFF00a3ad),
				  	child: IconButton(
				  		icon: const Icon(
				  			Icons.arrow_back,
				  			color: Colors.white,
				  		),
				  		onPressed: () => Navigator.pop(context),
				  	),
				  ),
				),

				//Bingkai Bismillah
				Container(
					height: (MediaQuery.of(context).orientation == Orientation.portrait) ? 150 : 120,
					decoration: const BoxDecoration(
						color: Color(0xFF00a3ad),
						borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100)),
						image: DecorationImage(
							fit: BoxFit.fill,
							image: AssetImage('assets/images/bismillah.png'),
						),
					),
					child: Center(
						child: SizedBox(
							width: 200,
							child: Text(
							  	fetchData.detailSurah[0].ar, 
							  	textAlign: TextAlign.center,
							  	style: const TextStyle(
							  		color: Colors.white,
							  		fontFamily: 'Isep Misbah',
							  		fontSize: 18,
							  		fontWeight: FontWeight.bold,
							  	),
							),
						),
					),
				),

				//Surah Ayah
				Expanded(
					child: ListView.builder(
						itemCount: fetchData.detailSurah.length,
						itemBuilder: (_, index) {
							return SurahDetailWidget(
								numberOfAyah: fetchData.detailSurah[index].number,
								ar: fetchData.detailSurah[index].ar,
								id: fetchData.detailSurah[index].id,
							);
						}
					),
				),
			]
		);
	}
}