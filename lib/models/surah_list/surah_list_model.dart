import 'name_model.dart';
import 'relevation_model.dart';

class SurahListModel{
	int number, numberOfVerses;
	Name name;
	Relevation relevation;


	SurahListModel({
		required this.number, 
		required this.numberOfVerses,
		required this.name,
		required this.relevation,
	});

	factory SurahListModel.fromJson(Map<String, dynamic> json){
		return SurahListModel(
			number: json['number'], 
			numberOfVerses: json['numberOfVerses'], 
			name: Name.fromJson(json['name']), 
			relevation: Relevation.fromJson(json['relevation']),
		);
	}
}