import 'name_model.dart';
import 'relevation_model.dart';

class SurahListModel {
  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;

  SurahListModel({
      this.number,
      this.sequence,
      this.numberOfVerses,
      this.name,
      this.revelation,
    });

  SurahListModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    sequence = json['sequence'];
    numberOfVerses = json['numberOfVerses'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    revelation = json['revelation'] != null
        ? Revelation.fromJson(json['revelation'])
        : null;
  }

}