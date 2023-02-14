import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skt_photo_gallery/src/constents/app_images.dart';
import 'package:skt_photo_gallery/src/constents/skt_colors.dart';
import 'package:skt_photo_gallery/src/constents/skt_strings.dart';
import 'package:skt_photo_gallery/src/dependency_injection/injector.dart';
import 'package:skt_photo_gallery/src/models/photo_model.dart';
import 'package:skt_photo_gallery/src/presentation/gallery_screen/widgets/image_full_view.dart';
import 'package:skt_photo_gallery/src/presentation/gallery_screen/widgets/skt_newtwork_image_view.dart';
import 'package:skt_photo_gallery/src/utils/custom_loader_logo.dart';

import 'package:skt_photo_gallery/src/widgets/skt_text.dart';
import 'package:toast/toast.dart';

import '../bloc/bloc.dart';

class GalleryScreenBuilder extends StatefulWidget {
  const GalleryScreenBuilder({Key? key}) : super(key: key);

  @override
  State<GalleryScreenBuilder> createState() => _GalleryScreenBuilderState();
}

class _GalleryScreenBuilderState extends State<GalleryScreenBuilder> {
  List<PhotoModel> _photoList = [];
  int? _pageNumber;
  Bloc bloc = Injector.resolve<GalleryScreenBloc>();
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    ToastContext().init(context);
    _pageNumber = -1;
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    _loadPhotos();
    _scrollController!.addListener(() {
      double maxScroll = _scrollController!.position.maxScrollExtent;
      double currentScroll = _scrollController!.position.pixels;
      double delta = MediaQuery.of(context).size.height * .05;
      if (maxScroll - currentScroll <= delta) {
        _loadPhotos();
      }
    });

    super.initState();
  }

  _loadPhotos({index = -1}) {
    _pageNumber = _pageNumber! + 1; // _pageNumber increment
    bloc.add(GalleryPhotoList(pageNumber: _pageNumber!, index: index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        // TODO: implement listener

        if (state is PhotoListReady) {
          _photoList.addAll(state.photoList);
          if (state.index > 0) {
            _showOnSwap(state
                .index); // showing new loaded image as a full screen view , when image load from full screen view
          }
        }
      },
      child: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    // color: SktColors.appColor,
                    child: Image.asset(
                      AppImages.APP_LOGO,
                      fit: BoxFit.scaleDown,
                      height: 30,
                    ),
                  ),
                ),
                if (_photoList.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          shrinkWrap: true,
                          itemCount: _photoList.length,
                          itemBuilder: (_, index) {
                            PhotoModel photo = _photoList[index];
                            return GestureDetector(
                                onTap: () => _showImage(index),
                                child: SktNetworkImageView(
                                    blurHashCode: photo.blurHash,
                                    image: photo.urls!.thumb));
                          }),
                    ),
                  ),
                if (state is LoadingPhotos)
                  Center(
                    child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        height: 40,
                        child: const FittedBox(child: SktCustomLoaderLogo())),
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  _showImage(int index) {
    imageFullView(context, _photoList[index], onSwap: (int val) {
      int itemNumber = index + val;
      _showOnSwap(itemNumber);
    });
  }

//view image when swpa
  _showOnSwap(itemNumber) {
    if (Navigator.canPop(context) && itemNumber >= 0) {
      if (itemNumber < _photoList.length) {
        Navigator.of(context).pop();
        _showImage(itemNumber);
      } else {
        //Loading new image for full screen , if the loaded image is finish
        Toast.show(SktStrings.newImageLoadingToast,
            duration: Toast.lengthShort, gravity: Toast.bottom);
        _loadPhotos(index: itemNumber);
      }
    }
  }
}
