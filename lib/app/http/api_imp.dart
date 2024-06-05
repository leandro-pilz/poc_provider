import 'package:poc_provider/core/http/api.dart';

final class ApiImp implements Api {
  @override
  Future get() async {
    return 'GET';
  }

  @override
  Future post({data}) async {
    return 'POST $data';
  }
}
