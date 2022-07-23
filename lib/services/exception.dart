abstract class AppException{
	String message;

	AppException({required this.message});
}

class FetchDataException extends AppException{
	FetchDataException({required super.message});
}