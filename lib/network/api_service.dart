import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:o2findermyanmar/constant/key_constant.dart';
import 'package:o2findermyanmar/constant/url_constant.dart';
import 'package:o2findermyanmar/network/model/divisions_model.dart';

import 'model/regions_model.dart';

class ApiService {
  final String _endPoint = "https://www.api.mmc19care.com";
  static Dio dio() {
    Dio dio = Dio();
//    dio.interceptors.add(PrettyDioLogger(
//      requestHeader: true,
//      requestBody: true,
//      responseBody: true,
//      responseHeader: false,
//      compact: false,
//    ));
    dio.options.headers["api_key"] = KeyConstant.apiKey;

    return dio;
  }

  final storage = FlutterSecureStorage();

  Future<DivisionsModel> getDivisions() async {
    try {
      Response response = await dio().get(_endPoint + UrlConstants.REGIONS);
      print(response.data);
      return DivisionsModel.fromJson(response.data);
    } on DioError catch (error) {
      throw error.response!.statusCode!;
    }
  }
}
