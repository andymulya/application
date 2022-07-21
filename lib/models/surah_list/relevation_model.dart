class Relevation{
	String arab, en, id;

	Relevation({
		required this.arab,
		required this.en,
		required this.id,
	});

	factory Relevation.fromJson(Map<String, dynamic> json){
		return Relevation(
			arab: json['arab'], 
			en: json['en'], 
			id: json['id'],
		);
	}
}