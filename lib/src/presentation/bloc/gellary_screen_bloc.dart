import 'package:bloc/bloc.dart';
import 'package:skt_photo_gallery/src/constents/skt_strings.dart';
import 'package:skt_photo_gallery/src/models/photo_model.dart';
import 'package:skt_photo_gallery/src/repositories/photo_repository.dart';
import 'package:skt_photo_gallery/src/widgets/skt_alert_dialog.dart';
import 'bloc.dart';

class GalleryScreenBloc extends Bloc<GalleryScreenEvent, GalleryScreenState> {
  final PhotoRepository photoRepository;
  GalleryScreenBloc({
    required this.photoRepository,
  }) : super(EmptyPhotos()) {
    on<GalleryPhotoList>(_mapGetPhotosEventToState);
  }

  void _mapGetPhotosEventToState(
      GalleryPhotoList event, Emitter<GalleryScreenState> emit) async {
    emit(LoadingPhotos());
    try {
      final List<PhotoModel> photos = await photoRepository.getPhotos(
          pageNumber: event.pageNumber, index: event.index);
      emit(PhotoListReady(photos, event.index));
    } catch (error, stacktrace) {
      sktAlertDialog(SktStrings.somethingWentRequestMessage);
    }
  }
}
