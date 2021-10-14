abstract class ImageState {}

class ImageInitialState extends ImageState {}

class ImageLoadState extends ImageState {}

class ImageSuccessState extends ImageState {}

class ImageErrorState extends ImageState {
  dynamic error;

  ImageErrorState(this.error);
}
