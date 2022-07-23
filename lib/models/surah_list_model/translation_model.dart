class Translation{
	String en, id;

	Translation({
		required this.en,
		required this.id
	});

	factory Translation.fromJson(Map<String, dynamic> json){
		return Translation(
			en: json['en'], 
			id: json['id'],
		);
	}
}