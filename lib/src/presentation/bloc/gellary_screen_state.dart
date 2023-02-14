import 'package:equatable/equatable.dart';
import 'package:skt_photo_gallery/src/models/photo_model.dart';

abstract class GalleryScreenState extends Equatable {
  GalleryScreenState([List props = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class LoadingPhotos extends GalleryScreenState {}

class PhotoListReady extends GalleryScreenState {
  final List<PhotoModel> photoList;
  final int index;
  PhotoListReady(this.photoList, this.index) : super();
}

class Error extends GalleryScreenState {
  final String error;
  Error(this.error) : super();
}

class EmptyPhotos extends GalleryScreenState {}
