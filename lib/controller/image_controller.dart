import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:oktoast/oktoast.dart';
import 'package:photo_gallery/model/errorModel/error_model.dart';
import 'package:photo_gallery/model/imageModel/image_model.dart';
import 'package:photo_gallery/services/apiService/api_service.dart';

class ImageController extends Get {
  int _page = 1;
  late final PagingController<int, ImageModel> pagingController;

  ImageController() {
    pagingController = PagingController(firstPageKey: _page);
    pagingController.addPageRequestListener((pageKey) async {
      getData();
    });
  }

  Future<void> getData() async {
    var (list, errorModel) = await _getImageList(_page);
    if (errorModel != null) {
      pagingController.error = errorModel;
    } else {
      _page++;
      pagingController.appendPage(list, _page);
    }
  }

  Future<(List<ImageModel>, ErrorModel?)> _getImageList(int page) async {
    try {
      Response response = await onApiCall(urlPath: apis.getImageList(page));
      Iterable list = response.data;

      return (list.map((e) => ImageModel.fromJson(e)).toList(), null);
    } catch (e) {
      var error = onError(e);
      showToast(error.message);
      return (<ImageModel>[], error);
    }
  }
}
