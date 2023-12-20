import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_gallery/model/imageModel/image_model.dart';
import 'package:photo_gallery/services/apiService/api_service.dart';

class ImageController extends Get {
  int _page = 1;
  late final PagingController<int, ImageModel> pagingController;

  ImageController(){
    pagingController = PagingController(firstPageKey: _page);
    pagingController.addPageRequestListener((pageKey) async {
      var list = await _getImageList(_page);
      _page++;
      pagingController.appendPage(list, _page);
    });
  }

  Future<List<ImageModel>> _getImageList(int page) async {
    try {
      Response response = await onApiCall(urlPath: apis.getImageList(page));
      Iterable list = response.data;

      return list.map((e) => ImageModel.fromJson(e)).toList();
    } catch (e) {
      var error = onError(e);
      log(error.message);
      throw error;
    }
  }
}
