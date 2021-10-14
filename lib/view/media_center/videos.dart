import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/video_bean/video_bean.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/video_cubit/video_cubit_logic.dart';
import 'package:flutter_task/view_model/video_cubit/video_state.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit()..getVideo(),
      child: BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {},
        builder: (context, state) {
          VideoCubit cubit = VideoCubit.get(context);
          return Scaffold(
            body: state is VideoSuccessState
                ? Container(
                    padding: const EdgeInsetsDirectional.all(16),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.videos.length,
                      itemBuilder: (context, index) {
                        return VideoCard(context, cubit.videos[index], cubit);
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: bgPrimary,
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget VideoCard(context, VideoBean videoBean, VideoCubit cubit) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * .45,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(videoBean.image), fit: BoxFit.fill)),
      child: InkWell(
        onTap: () {
          cubit.openLink(videoBean.videoUrl);
        },
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset("assets/images/play.png"),
        ),
      ));
}
