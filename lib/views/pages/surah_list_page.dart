import 'package:application/providers/surah_detail_provider.dart';
import 'package:application/providers/surah_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'surah_detail_page.dart';

class SurahListPage extends StatelessWidget{
	static const routeName = '/surahListPage';
	const SurahListPage({super.key});

	@override
	Widget build(BuildContext context){
		final getSurahDetail = Provider.of<SurahDetailProvider>(context);

		return Scaffold(
			appBar: AppBar(
				title: const Text("Al - Qur'an"),
			),

			body: Consumer<SurahListProvider>(
				builder: (context, data, _){
					if(data.isLoading){
						return const Center(
							child: CircularProgressIndicator(),
						);
					}
					if(data.errorMessage != null){
						return Center(
							child: Text(data.errorMessage.toString()),
						);
					}
					
					return Column(
						mainAxisAlignment: MainAxisAlignment.spaceAround,
						children: [
							Container(
								alignment: Alignment.topLeft,
								margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
								child: const Text('Daftar Surah'),
							),

							//Item Surah
							Container(
								margin: const EdgeInsets.only(right: 10, left: 10),
								height: (MediaQuery.of(context).orientation == Orientation.portrait) ?
								MediaQuery.of(context).size.height * 0.80 : MediaQuery.of(context).size.height * 0.70,
								child: ListView.builder(
									itemCount: data.dataSurahList!.length,
									itemBuilder: (_, index){
										return ListTile(
											dense: true,
											title: Text(data.dataSurahList![index].name),
											subtitle: Text('Ayat | ${data.dataSurahList![index].numberOfAyah}'),
											trailing: Text(data.dataSurahList![index].nameTranslations.ar),
											selectedTileColor: Colors.black,
											onTap: () {
												getSurahDetail.setNumberSurahSelected(data.dataSurahList![index].numberOfSurah);
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
													child: Text(data.dataSurahList![index].numberOfSurah.toString()),
												),
											),
										);
									},
								),
							),
						],
					);
				}
			),
		);
	}
}