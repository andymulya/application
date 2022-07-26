import 'package:application/models/surah_list_model/surah_list_model.dart';
import 'package:application/services/exception.dart';
import 'package:application/services/surah_list_servies/surah_list_service.dart';
import 'package:flutter/material.dart';

class SurahListProvider with ChangeNotifier{
	bool _isLoading = false;
	List<SurahListModel> _dataSurahList = [];
	String? _errorMessage;

	SurahListProvider(){
		fetchDataSurahList();
	}


	bool get isLoading => _isLoading;
	List<SurahListModel>? get dataSurahList => _dataSurahList;
	String? get errorMessage => _errorMessage;

	void setIsLoading(bool loading){
		_isLoading = loading;
		notifyListeners();
	}
	void setDataSurahList(List<SurahListModel> dataSurahList){
		_dataSurahList = dataSurahList;
	}
	void setErrorMessage(String errorMessage){
		_errorMessage = errorMessage;
	}

	void fetchDataSurahList() async {

		setIsLoading(true);

		final fetchData = await SurahListServices.getSurahList();

		if(fetchData is List<SurahListModel>){
			setDataSurahList(fetchData);
		}

		if(fetchData is FetchDataException){
			setErrorMessage(fetchData.message);
		}
		setIsLoading(false);
	}
}