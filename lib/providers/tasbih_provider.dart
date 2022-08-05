import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier{
	int _count = 0;

	int get count => _count;
	set count(int count){
		_count = count;
		notifyListeners();
	}


	void increment() => count++;

	void resetCount() => count = 0;
}