class SurahDetailModel {

  int number;
  String ar, en, id; 

  SurahDetailModel({
    required this.number,
    required this.ar,
    required this.en,
    required this.id
  });

  factory SurahDetailModel.fromJson(Map<String, dynamic> json){
    return SurahDetailModel(
      number: json['number'], 
      ar: json['text'], 
      en: json['translation_en'], 
      id: json['translation_id'],
    );
  }
}