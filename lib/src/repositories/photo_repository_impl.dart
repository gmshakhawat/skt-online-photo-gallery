import 'package:skt_photo_gallery/src/constents/service_endpoints.dart';
import 'package:skt_photo_gallery/src/constents/skt_constant.dart';
import 'package:skt_photo_gallery/src/models/photo_model.dart';
import 'package:skt_photo_gallery/src/repositories/photo_repository.dart';
import 'package:skt_photo_gallery/src/services/api_request.dart';
import 'package:skt_photo_gallery/src/utils/testing.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  // will implement service client
  APIRequest apiRequest;
  PhotoRepositoryImpl(this.apiRequest);

  // APIRequest apiRequest = APIRequest;

  @override
  Future<List<PhotoModel>> getPhotos(
      {required int pageNumber, index = -1}) async {
    List<PhotoModel>? data;

    int _itemPerPage = pageNumber == 0
        ? SktConstants.imagePerPage
        : index > 0
            ? 1
            : 10;

    var tempData = await apiRequest.get(
        endPoint:
            "${ServiceEndPoints.getPhotos}?client_id=${SktConstants.accessKey}&page=$pageNumber&per_page=$_itemPerPage");
    if (tempData != null) {
      data = photoModelFromJson(tempData);
    }

    sktPrint(tempData);
    return data!;
  }
}
