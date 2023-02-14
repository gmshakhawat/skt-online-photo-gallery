
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
import 'package:skt_photo_gallery/src/presentation/bloc/bloc.dart';
import 'package:skt_photo_gallery/src/repositories/photo_repository.dart';
import 'package:skt_photo_gallery/src/repositories/photo_repository_impl.dart';
import 'package:skt_photo_gallery/src/services/api_request.dart';
import 'package:http/http.dart';

part 'injector.g.dart';
abstract class Injector {
  static KiwiContainer? container;
  static GetIt? getIt;

  static void setup() {
    container = KiwiContainer();
    getIt = GetIt.instance;
    _$Injector()._configure();
  }

  static final resolve = container!.resolve;

  void _configure() {
    _configureNetworkInstances();
    _configureNetworkModule();
    _configureRepositoryModule();
    _configureBlocModule();
  }




  @Register.singleton(APIRequest)
  void _configureNetworkModule();

  void _configureNetworkInstances() {
   

            
    container!.registerSingleton<Client>((c) {
      Client client = Client();
  
      return client;
    });
  }



  @Register.singleton(PhotoRepository, from: PhotoRepositoryImpl)
  void _configureRepositoryModule();



  @Register.factory(GalleryScreenBloc)
  void _configureBlocModule();
}
