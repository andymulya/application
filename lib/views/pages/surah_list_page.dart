import 'package:application/providers/surah_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'surah_detail_page.dart';

class SurahListPage extends StatelessWidget{
	static const routeName = '/surahListPage';
	const SurahListPage({super.key});

	@override
	Widget build(BuildContext context){
		final dataSurahList = Provider.of<SurahListProvider>(context);

		return Scaffold(
			appBar: AppBar(
				title: const Text('Daftar Surah'),
			),

			body: _ui(dataSurahList, context),
		);
	}

	Widget _ui(SurahListProvider fetchData, BuildContext context){
		if(fetchData.isLoading){
			return const Center(
				child: CircularProgressIndicator(),
			);
		}
		if(fetchData.errorMessage != null){
			return Center(
				child: Text(fetchData.errorMessage.toString()),
			);
		}
		
		return ListView.builder(
			itemCount: fetchData.dataSurahList!.length,
			itemBuilder: (_, index){
				return ListTile(
					title: Text(fetchData.dataSurahList![index].name!.transliteration!.id.toString()),
					subtitle: Text('Ayat | ${fetchData.dataSurahList![index].numberOfVerses}'),
					trailing: Text(fetchData.dataSurahList![index].name!.short.toString()),
					selectedTileColor: Colors.black,
					onTap: () {
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
							child: Text(fetchData.dataSurahList![index].number.toString()),
						),
					),
				);
			},
		);
	}
}