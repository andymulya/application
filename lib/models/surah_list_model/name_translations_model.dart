class NameTranslations{
  String ar, en, id;

  NameTranslations({
    required this.ar,
    required this.en,
    required this.id,
  });

  factory NameTranslations.fromJson(Map<String, dynamic> json){
    return NameTranslations(
      ar: json['ar'], 
      en: json['en'], 
      id: json['id'],
    );
  }
}