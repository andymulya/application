class SurahListModel {
  
  String name, place, type;
  NameTranslations nameTranslations;
  int numberOfAyah, numberOfSurah, recitation;

  SurahListModel({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitation,
    required this.type
  });

  factory SurahListModel.fromJson(Map<String, dynamic> json){
    return SurahListModel(
      name: json['name'], 
      nameTranslations: NameTranslations.fromJson(json['name_translations']), 
      numberOfAyah: json['number_of_ayah'], 
      numberOfSurah: json['number_of_surah'], 
      place: json['place'], 
      recitation: json['recitation'], 
      type: json['type'],
    );
  }

}

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