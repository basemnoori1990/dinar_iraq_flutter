import 'package:get_it/get_it.dart';
import '../utilis/dio_utilites.dart';

class BaseRepository {
  DioUtils dio = GetIt.instance<DioUtils>();
}
