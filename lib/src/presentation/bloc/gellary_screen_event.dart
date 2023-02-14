import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GalleryScreenEvent extends Equatable {
  GalleryScreenEvent([List props = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class InitPhotoBloc extends GalleryScreenEvent {}

class GalleryPhotoList extends GalleryScreenEvent {
  final int pageNumber;
  final int index;
  GalleryPhotoList({required this.pageNumber,this.index=-1}) : super();
}
