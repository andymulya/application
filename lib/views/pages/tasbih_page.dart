import 'package:application/providers/tasbih_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/button_count_widget.dart';
import '../widgets/button_reset_widget.dart';

class TasbihPage extends StatelessWidget{
	static const routeName = '/tasbih_page';
	const TasbihPage({super.key});

	@override 
	Widget build(BuildContext context){
		final tasbihCount = Provider.of<TasbihProvider>(context);

		return Scaffold(
			backgroundColor: const Color(0xFF00a3ad),
			body: SafeArea(
				child: Column(
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

						//Display dan count
						LayoutBuilder(builder: (_, constraints){

							if(constraints.maxWidth <= 600){
								return SizedBox(
									child: Column(
										children: [
											//Display
											Container(
												margin: const EdgeInsets.symmetric(vertical: 15),
												width: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.65 : 
												(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.35 : constraints.maxWidth * 0.35,

												height: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.65 : 
												(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.35 : constraints.maxWidth * 0.35,
												decoration: BoxDecoration(
													color: const Color(0xFFeafffe),
													borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 1),
													boxShadow: <BoxShadow>[
														BoxShadow(
															color: Colors.black.withOpacity(0.5),
															blurRadius: 0.5,
															spreadRadius: 0.7,
															offset: const Offset(1, -1),
														),
													]
												),
												child: Center(
													child: Text(tasbihCount.count.toString(), 
													  	style: TextStyle(
													  		fontSize: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.3 : 
																	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.15 : constraints.maxWidth * 0.15,
													  	),
													),
												),
											),

											//Button Reset
											Align(
												alignment: Alignment.topLeft,
												child: ButtonResetWidget(
													constraints: constraints, 
													onTap: (){
														tasbihCount.resetCount();
													}
												),
											),

											//Button Count
											ButtonCountWidget(
												constraints: constraints, 
												onTap: (){
													tasbihCount.increment();
												},
											),
										],
									),
								);
							}else{

								return SizedBox(
									child: Row(
										children: [
											//Display
											Container(
												margin: const EdgeInsets.symmetric(horizontal: 35),
												width: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.65 : 
												(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.35 : constraints.maxWidth * 0.35,

												height: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.65 : 
												(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.35 : constraints.maxWidth * 0.35,
												decoration: BoxDecoration(
													color: const Color(0xFFeafffe),
													borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 1),
													boxShadow: <BoxShadow>[
														BoxShadow(
															color: Colors.black.withOpacity(0.5),
															blurRadius: 0.5,
															spreadRadius: 0.7,
															offset: const Offset(1, -1),
														),
													]
												),
												child: Center(
													child: Text(tasbihCount.count.toString(), 
													  	style: TextStyle(
													  		fontSize: (constraints.maxWidth <= 600) ? constraints.maxWidth * 0.3 : 
																	(constraints.maxWidth <= 800) ? constraints.maxWidth * 0.15 : constraints.maxWidth * 0.15,
													  	),
													),
												),
											),

											//Button Reset
											ButtonResetWidget(
												constraints: constraints, 
												onTap: () => tasbihCount.resetCount(),
											),

											//Button Count
											ButtonCountWidget(
												constraints: constraints, 
												onTap: () => tasbihCount.increment(),
											),
										],
									),
								);
							}
						}),
					]
				),
			),
		);
	}
}