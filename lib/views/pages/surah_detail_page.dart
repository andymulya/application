import 'package:application/models/surah_detail_model/surah_detail_model.dart';
import 'package:flutter/material.dart';

class SurahDetailPage extends StatelessWidget{
	static const routeName = '/surahDetailPage';

	const SurahDetailPage({super.key});

	@override
	Widget build(BuildContext context){
		
		return Scaffold(
			appBar: AppBar(
				title: const Text('Detail Surah'),
			),
			body: ,
		);
	}

	Widget _ui(SurahDetailModel fetchData){
		if(fetchData.isLoading){
			return const CircularProgressIndicator();
		}
		if(fetchData.errorMessage != null){
			return Text(fetchData.errorMessage.toString());
		}

		return ListView.builder(
			itemCount: fetchData.detailSurah.length,
			itemBuilder: (_, index){
				return Text(fetchData.detailSurah[index].id);
			}
		);
	}
}