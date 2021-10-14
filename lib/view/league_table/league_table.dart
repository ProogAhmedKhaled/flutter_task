import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/user_bean/user_bean.dart';
import 'package:flutter_task/model/cach_helper/cach_helper.dart';
import 'package:flutter_task/model/repos/user_repo/user_repo.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/user_cubit/user_cubit_logic.dart';
import 'package:flutter_task/view_model/user_cubit/user_state.dart';

class LeagueTable extends StatelessWidget {
  const LeagueTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUser(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          UserCubit userCubit = UserCubit.get(context);
          return
            state is UserSuccessState ?
            Directionality(
            textDirection: CachHelper.get(key: 'lang') == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Scaffold(
              appBar: defaultAppBar(),
              body: Container(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: userCubit.users.length,
                    itemBuilder: (context, index) =>
                        buildUserCard(context, userCubit.users[index]),
                  )),
            ),
          ): Center(child: CircularProgressIndicator(color: bgPrimary,),) ;
        },
      ),
    );
  }
}

Widget buildCircleAvatarItem(String url) => Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill)),
    );

Widget buildUserCard(context, UserData user) => Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          // color: bgBlend.withOpacity(.8),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            child: buildCircleAvatarItem(user.avatar),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width * .2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  customText(
                      title: user.firstName + user.lastName,
                      fontColor: bgPrimary , weight: FontWeight.bold),
                  customText(title: user.email, fontColor: bgPrimary),
                ],
              ),
            ),
          )
        ],
      ),
    );
