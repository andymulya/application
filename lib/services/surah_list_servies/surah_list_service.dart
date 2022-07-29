import 'dart:convert';
import 'dart:io';

import 'package:application/models/surah_list_model/surah_list_model.dart';
import 'package:application/services/exception.dart';
import 'package:http/http.dart' as http;

class SurahListServices{

	static Future<Object> getSurahList() async {
		final url = Uri.parse('https://raw.githubusercontent.com/andymulya/quranJson/master/surah_list.json');

		try{
			final response = await http.get(url);
			List<dynamic> resultDecode = json.decode(response.body) as List<dynamic>;
			List<SurahListModel> result = resultDecode.map((e) => SurahListModel.fromJson(e)).toList();

			return result;

		}on SocketException{
			return FetchDataException(message: 'No Internet Connection');
		}
	}
}