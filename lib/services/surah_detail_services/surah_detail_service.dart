import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/surah_detail_model/surah_detail_model.dart';
import '../exception.dart';

class SurahDetailService{

	static Future<Object> getDetailSurah(int? numSurah) async {
		final url = Uri.parse('https://raw.githubusercontent.com/andymulya/quranJson/master/surah/$numSurah.json');

		try{
			final response = await http.get(url);
			List<dynamic> resultDecode = json.decode(response.body)['verses'] as List<dynamic>;
			List<SurahDetailModel> result = resultDecode.map((e) => SurahDetailModel.fromJson(e)).toList();
			return result;

		}catch(e){
			return FetchDataException(message: e.toString());
		}
	}

}