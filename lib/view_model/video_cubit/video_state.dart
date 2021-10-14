abstract class VideoState {}

class VideoInitialState extends VideoState {}

class VideoLoadState extends VideoState {}

class VideoSuccessState extends VideoState {}

class VideoErrorState extends VideoState {
  dynamic error;

  VideoErrorState(this.error);
}
