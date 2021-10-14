import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/repos/image_repo/image_repo.dart';

import 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  static ImageCubit get(context) => BlocProvider.of(context);

  List<dynamic> images = [];

   getImage() {
    emit(ImageLoadState());
    ImageRepo.getAllImage().then((value) {
       images = value;
      print("Image From Image Cubit --> " + value.toString());
      emit(ImageSuccessState());
    }).catchError((error) {
      print("Error in ImageCubit Logic " + error.toString());
      emit(ImageErrorState(error));
    });
  }

}
