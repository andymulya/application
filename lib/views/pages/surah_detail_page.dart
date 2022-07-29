import 'package:application/providers/surah_detail_provider.dart';
import 'package:application/services/exception.dart';
import 'package:application/views/widgets/socked_exception_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
			if(fetchData.errorMessage is FetchDataException){
				return const SockedExceptionWidget();
			}
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
							height: 150,
							child: (fetchData.detailSurah.length != 129) ? 
							const Image(
								image: AssetImage('assets/images/kaligrafi.png'),
							) :
							Center(
								child: Text('At - Taubah', 
									style: GoogleFonts.armata(
										fontSize: 17,
										fontWeight: FontWeight.bold,
										color: Colors.white,
										shadows: <Shadow>[
											Shadow(
												offset: const Offset(1, -1),
												blurRadius: 0.5,
												color: Colors.black.withOpacity(0.5),
											),
											Shadow(
												offset: const Offset(1, -1),
												blurRadius: 0.5,
												color: Colors.black.withOpacity(0.5)
											),
										]
									),
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