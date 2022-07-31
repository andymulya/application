import 'package:application/providers/surah_list_provider.dart';
import 'package:application/views/pages/tasbih_page.dart';
import 'package:application/views/widgets/button_custom_tasbih_widget.dart';
import 'package:application/views/widgets/surah_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SurahListPage extends StatelessWidget{
	static const routeName = '/surahListPage';
	const SurahListPage({super.key});

	@override
	Widget build(BuildContext context){

		return Scaffold(
			appBar: AppBar(
				title: const Text("Al - Qur'an"),
				actions: [
					ButtonCustomTasbihWidget(
						onTap: () => Navigator.pushNamed(context, TasbihPage.routeName),
					),
				],
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
								child: LayoutBuilder(
									builder: (_, constraints){
										if(constraints.maxWidth <= 600){

											return ListView.builder(
												itemCount: data.dataSurahList!.length,
												itemBuilder: (_, index){
													return SurahListTileWidget(
														numberOfSurah: data.dataSurahList![index].numberOfSurah,
														numberOfAyah: data.dataSurahList![index].numberOfAyah, 
														nameSurahId: data.dataSurahList![index].name, 
														nameSurahAr: data.dataSurahList![index].nameTranslations.ar, 
														place: data.dataSurahList![index].place,
													);
												}
											);
										}else if(constraints.maxWidth <= 800){

											return GridView.builder(
												itemCount: data.dataSurahList!.length,
												gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
													childAspectRatio: 5,
													crossAxisCount: 2,
												), 
												itemBuilder: (_, index){
													return SurahListTileWidget(
														numberOfSurah: data.dataSurahList![index].numberOfSurah,
														numberOfAyah: data.dataSurahList![index].numberOfAyah, 
														nameSurahId: data.dataSurahList![index].name, 
														nameSurahAr: data.dataSurahList![index].nameTranslations.ar, 
														place: data.dataSurahList![index].place,
													);
												},
											);

										}else{

											return GridView.builder(
												itemCount: data.dataSurahList!.length,
												gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
													childAspectRatio: 3,
													crossAxisCount: 4,
												), 
												itemBuilder: (_, index){
													return SurahListTileWidget(
														numberOfSurah: data.dataSurahList![index].numberOfSurah,
														numberOfAyah: data.dataSurahList![index].numberOfAyah, 
														nameSurahId: data.dataSurahList![index].name, 
														nameSurahAr: data.dataSurahList![index].nameTranslations.ar, 
														place: data.dataSurahList![index].place,
													);
												},
											);

										}
									}
								),
							),
						],
					);
				}
			),
		);
	}
}