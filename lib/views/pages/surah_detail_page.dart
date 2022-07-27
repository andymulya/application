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
			body: SafeArea(
				child: Column(
					children: [
						Container(
							alignment: Alignment.topLeft,
							child: IconButton(
								icon: Icon(
									Icons.arrow_back,
									color: Colors.grey.shade700,
								),
								onPressed: () => Navigator.pop(context),
							),
						),

						//UI Ayah
						Expanded(
							child: _ui(context ,getDetailSurah),
						),
					],
				),
			),
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
				//Bingkai Bismillah
				Container(
					height: (MediaQuery.of(context).orientation == Orientation.portrait) ? 150 : 120,
					decoration: const BoxDecoration(
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
							  		color: Color(0xFF010465),
							  		fontFamily: 'Isep Misbah',
							  		fontSize: 18,
							  		fontWeight: FontWeight.bold,
							  	),
							  	softWrap: false,
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