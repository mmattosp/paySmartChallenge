import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {

  String genToken(String token) => 'Bearer $token';

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['Authorization'] = genToken('eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMDAyZTAwZTRmNzZiMjY3ZGJmZDBjMmZlYTZmY2I1YSIsInN1YiI6IjYxYzhlODExZjVmMWM1MDA4ZjRkZDhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-tDyZVp4f1Ah8X2NeQZUaRF9WXz1JJaPeM1D7kVeMEQ');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    print('ERRO DESCONHECIDO: ${err.message} - ${err.request.path} ');
  }

}