import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/surah_detail_provider.dart';
import '../pages/surah_detail_page.dart';

class SurahListTileWidget extends StatelessWidget{

	final int numberOfSurah, numberOfAyah;
	final String nameSurahId, nameSurahAr, place; 

	const SurahListTileWidget({
		required this.numberOfSurah,
		required this.numberOfAyah,
		required this.nameSurahId,
		required this.nameSurahAr,
		required this.place,
		super.key
	});

	@override
	Widget build(BuildContext context){
		final getSurahDetail = Provider.of<SurahDetailProvider>(context);

		return ListTile(
			dense: true,
			title: Text(nameSurahId),
			subtitle: Text('$numberOfAyah Ayat || $place'),
			trailing: Text(nameSurahAr),
			selectedTileColor: Colors.black,
			onTap: () {
				getSurahDetail.setNumberSurahSelected(numberOfSurah);
				getSurahDetail.getSurahDetail();
				Navigator.pushNamed(context, SurahDetailPage.routeName);
			},
			leading: Container(
				width: 40,
				height: 40,
				decoration: const BoxDecoration(
					image: DecorationImage(
						image: AssetImage('assets/images/arabic.png'),
					),
				),
				child: Center(
					child: Text(numberOfSurah.toString()),
				),
			),
		);
	}
}