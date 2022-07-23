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
			body: Container(
				child: Text('Hello World'),
			),
		);
	}
}