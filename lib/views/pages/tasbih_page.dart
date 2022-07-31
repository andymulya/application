import 'package:application/views/widgets/button_count_widget.dart';
import 'package:application/views/widgets/button_reset_widget.dart';
import 'package:flutter/material.dart';

class TasbihPage extends StatefulWidget{
	static const routeName = '/tasbih';
	const TasbihPage({super.key});

	@override
	State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage>{

	int _count = 0;

	@override 
	Widget build(BuildContext context){
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
													child: Text('$_count', 
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
														setState((){
															_count = 0;
														});
													}
												),
											),

											//Button Count
											ButtonCountWidget(
												constraints: constraints, 
												onTap: (){
													setState((){
														_count++;
													});
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
													child: Text('$_count', 
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
												onTap: (){
													setState((){
														_count = 0;
													});
												}
											),

											//Button Count
											ButtonCountWidget(
												constraints: constraints, 
												onTap: (){
													setState((){
														_count++;
													});
												},
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