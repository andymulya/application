import 'package:application/models/surah_detail_model/surah_detail_model.dart';
import 'package:application/services/exception.dart';
import 'package:application/services/surah_detail_services/surah_detail_service.dart';
import 'package:flutter/cupertino.dart';

class SurahDetailProvider with ChangeNotifier{
	bool _isLoading = false;
	List<SurahDetailModel> _detailSurah = [];
	String? _errorMessage;
	int? _numberSurahSelected;

	bool get isLoading => _isLoading;
	List<SurahDetailModel> get detailSurah => _detailSurah;
	String? get errorMessage => _errorMessage;

	void setLoading(bool isLoading){
		_isLoading = isLoading;
		notifyListeners();
	}

	void setDetailSurah(List<SurahDetailModel> detailSurah){
		_detailSurah = detailSurah;
	}

	void setErrorMessage(String errorMessage){
		_errorMessage = errorMessage;
	}

	void setNumberSurahSelected(int numberSurahSelected){
		_numberSurahSelected = numberSurahSelected;
	}

	void getSurahDetail() async {

		setLoading(true);

		final getData = await SurahDetailService.getDetailSurah(_numberSurahSelected);
		
		if(getData is List<SurahDetailModel>){
			setDetailSurah(getData);
		}
		if(getData is FetchDataException){
			setErrorMessage(getData.message);
		}

		setLoading(false);
	}
}