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
				title: const Text('Daftar Surah'),
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
					
					return ListView.builder(
						itemCount: data.dataSurahList!.length,
						itemBuilder: (_, index){
							return ListTile(
								title: Text(data.dataSurahList![index].nama),
								subtitle: Text('Ayat | ${data.dataSurahList![index].ayat}'),
								trailing: Text(data.dataSurahList![index].asma),
								selectedTileColor: Colors.black,
								onTap: () {
									getSurahDetail.getSurahDetail(int.parse(data.dataSurahList![index].nomor));
									Navigator.pushNamed(context, SurahDetailPage.routeName, arguments: getSurahDetail.detailSurah[index]);
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
										child: Text(data.dataSurahList![index].nomor.toString()),
									),
								),
							);
						},
					);
				}
			),
		);
	}
}