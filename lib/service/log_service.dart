






import 'package:logger/logger.dart';

class LogService {
  static final Logger _logger = Logger (
      filter: DevelopmentFilter(),
      printer: PrettyPrinter());

  static void d(String message){
    _logger.d(message);
  }

  static void i(emailController){
    _logger.i(emailController);
  }
  static void w(String message){
    _logger.w(message);
  }
  static void e(String message){
    _logger.e(message);
  }


}

