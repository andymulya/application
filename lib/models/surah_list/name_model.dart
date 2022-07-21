import 'translation_model.dart';
import 'transliteration_model.dart';

class Name{
	String short;
	Transliteration transliteration;
	Translation translation;

	Name({
		required this.short,
		required this.transliteration,
		required this.translation,
	});

	factory Name.fromJson(Map<String, dynamic> json){
		return Name(
			short: json['short'],
			transliteration: Transliteration.fromJson(json['transliteration']), 
			translation: Translation.fromJson(json['translation']),
		);
	}
}