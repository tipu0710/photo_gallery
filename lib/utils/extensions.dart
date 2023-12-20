import 'package:photo_gallery/services/apiService/api_service.dart';

extension EmailValidator on String? {
  bool validateEmail() {
    if (this == null) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!);
  }
}

extension ChangeUrl on String {
  changeUrl({int? height, int? width}) {
    String url = this;
    List<String> list = url.split("/");
    return "${ApiService.baseUrl}/id/${list[4]}/${height ?? 300}/${width ?? 200}";
  }
}