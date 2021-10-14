import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/repos/Video_repo/Video_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitialState());

  static VideoCubit get(context) => BlocProvider.of(context);

  List<dynamic> videos = [];

   getVideo() {
    emit(VideoLoadState());
    VideoRepo.getAllVideos().then((value) {
       videos = value;
      print("Video From Video Cubit --> " + value.toString());
      emit(VideoSuccessState());
    }).catchError((error) {
      print("Error in Video Cubit Logic " + error.toString());
      emit(VideoErrorState(error));
    });
  }

  openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("not installed");
    }
  }

}
