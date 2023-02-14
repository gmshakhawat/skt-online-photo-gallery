// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureNetworkModule() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => APIRequest(client: c<Client>()));
  }

  @override
  void _configureRepositoryModule() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<PhotoRepository>(
        (c) => PhotoRepositoryImpl(c<APIRequest>()));
  }

  @override
  void _configureBlocModule() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => GalleryScreenBloc(photoRepository: c<PhotoRepository>()));
  }
}
