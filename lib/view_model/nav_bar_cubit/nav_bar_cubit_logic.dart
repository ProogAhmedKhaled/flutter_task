import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/view/home/home.dart';
import 'package:flutter_task/view/league_table/league_table.dart';
import 'package:flutter_task/view/media_center/media_center_container.dart';
import 'package:flutter_task/view/setting/setting.dart';
import 'package:flutter_task/view_model/nav_bar_cubit/nav_bar_state.dart';

class NavBarAppCubit extends Cubit<NavBarState> {
  NavBarAppCubit() : super(NavBarInitialState());

  static NavBarAppCubit get(context) => BlocProvider.of(context);

  int pageIndex = 0;

  List<Widget> screens = [
    Home(),
    LeagueTable(),
    MediaCenter(),
    Center(
      child: Text("Statics"),
    ),
    Setting()
  ];
  List<String> titles = ["Business", "Sports", "Science","Setting"];

  void changeIndex(int index) {
    pageIndex = index;
    emit(NavBarChangeState());
  }



}
