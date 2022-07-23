import 'transliteration_model.dart';

class Name {
  String? short;
  String? long;
  Transliteration? transliteration;
  Transliteration? translation;

  Name({this.short, this.long, this.transliteration, this.translation});

  Name.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
    transliteration = json['transliteration'] != null
        ? Transliteration.fromJson(json['transliteration'])
        : null;
    translation = json['translation'] != null
        ? Transliteration.fromJson(json['translation'])
        : null;
  }

}