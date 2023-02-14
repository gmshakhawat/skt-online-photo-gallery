import 'package:skt_photo_gallery/src/models/photo_model.dart';

abstract class PhotoRepository {
  Future<List<PhotoModel>> getPhotos({required int pageNumber, index});
}
