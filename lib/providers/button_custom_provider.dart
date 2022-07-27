import 'package:flutter/material.dart';

class ButtonCustomProvider with ChangeNotifier{
	bool _isTap = false;

	bool get isTap => _isTap;

	set isTap(bool isTap){
		_isTap = isTap;
		notifyListeners();
	}

	Color get color => (_isTap) ? const Color(0xFF00a3ad) : const Color(0xFFeea012);
}