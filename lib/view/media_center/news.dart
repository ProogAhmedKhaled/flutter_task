import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/news_bean/news_bean.dart';
import 'package:flutter_task/model/repos/news_repo/news_repo.dart';
import 'package:flutter_task/view/media_center/news_info.dart';
import 'package:flutter_task/view/shared/component.dart';
import 'package:flutter_task/view/shared/styles/colors.dart';
import 'package:flutter_task/view_model/news_cubit/news_cubit_logic.dart';
import 'package:flutter_task/view_model/news_cubit/news_state.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsContainer extends StatelessWidget {
  RefreshController _refreshController = RefreshController();

  // ScrollController _scrollController = ScrollController();
  //
  // void pagination(BuildContext context) {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       BlocProvider.of<NewsCubit>(context)
  //         ..changePageNumber()
  //         ..getNews();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            body: state is NewsSuccessState
                ? SmartRefresher(
                    controller: _refreshController,
                    onRefresh: () {
                      cubit.resetPageNumber();
                      cubit.news = [];
                      cubit.getNews();
                    },
                    enablePullUp: true,
                    onLoading: () {
                      // print( "Page Number before " + cubit.pageNumber.toString());
                      if (cubit.pageNumber < 3) {
                        cubit.changePageNumber();
                        // print( "Page Number " + cubit.pageNumber.toString());
                        cubit.getNews();
                        if (state is NewsSuccessState) {
                          _refreshController.loadComplete();
                        } else if (state is NewsErrorState) {
                          _refreshController.loadFailed();
                        }
                      } else {
                        // print( "Page Number Finial" + cubit.pageNumber.toString());
                        cubit.pageNumber = 1;
                        // print( "Page Number Finial" + cubit.pageNumber.toString());
                        _refreshController.loadNoData();
                      }
                    },
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.news.length,
                      itemBuilder: (context, index) {
                        return newsCard(context, cubit.news[index]);
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
}

Widget newsCard(context, NewsBean newsBean) => InkWell(
      onTap: () {
        Get.to(NewsInfo(newsBean: newsBean));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Container(
          child: Row(
            children: [
              buildImageContainer(
                  height: MediaQuery.of(context).size.width * .3,
                  width: MediaQuery.of(context).size.width * .4,
                  imgUrl: newsBean.image),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * .32,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          title: "sports_league", fontColor: bgSecondary),
                      customText(
                          title: newsBean.titleAr,
                          fontColor: bgPrimary,
                          weight: FontWeight.bold,
                          maxLines: 2),
                      SizedBox(
                        height: 10,
                      ),
                      customText(
                          title: newsBean.createdAt,
                          fontColor: bgSecondary,
                          fontSize: 11),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

// String formatDate(String createdAt) {
//   String date = "";
//   date = DateFormat.yMMMd('ar').format(DateTime.parse(createdAt));
//   // print(date);
//   return date;
// }
//
// initDateFormate() async {
//   await initializeDateFormatting("ar", null);
// }
