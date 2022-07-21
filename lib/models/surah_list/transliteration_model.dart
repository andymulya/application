class Transliteration{
	String en, id;

	Transliteration({
		required this.en,
		required this.id,
	});

	factory Transliteration.fromJson(Map<String, dynamic> json){
		return Transliteration(
			en: json['en'], 
			id: json['id'],
		);
	}
}