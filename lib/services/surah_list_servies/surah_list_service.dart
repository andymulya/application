import 'dart:convert';
import 'dart:io';

import 'package:application/models/surah_list_model/surah_list_model.dart';
import 'package:application/services/exception.dart';
import 'package:application/services/services.dart';
import 'package:http/http.dart' as http;

class SurahListServices implements ConnectApi{

	@override
	Future<Object> getData() async {
		final url = Uri.parse('https://api.quran.sutanlab.id/surah');

		try{
			final response = await http.get(url);
			List<dynamic> resultDecode = json.decode(response.body)['data'];
			List<SurahListModel> result = resultDecode.map((e) => SurahListModel.fromJson(e)).toList();

			return result;

		}on SocketException{
			throw FetchDataException(message: 'No Interet connection');
		}
	}
}