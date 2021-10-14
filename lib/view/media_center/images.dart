import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/image_bean/image_bean.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/image_cubit/image_cubit_logic.dart';
import 'package:flutter_task/view_model/image_cubit/image_state.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit()..getImage(),
      child: BlocConsumer<ImageCubit, ImageState>(
        listener: (context, state) {},
        builder: (context, state) {
          ImageCubit cubit = ImageCubit.get(context);
          return Scaffold(
            body: state is ImageSuccessState ?
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsetsDirectional.all(16),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  children: List.generate(
                    cubit.images.length,
                    (index) {
                      return imageCard(context, cubit.images[index]);
                    },
                  ),
                ),
              ),
            ): Center(child: CircularProgressIndicator(color: bgPrimary,),),
          );
        },
      ),
    );
  }
}

Widget imageCard(context, ImageBean imageBean) => Container(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(imageBean.image), fit: BoxFit.fill)),
    );
