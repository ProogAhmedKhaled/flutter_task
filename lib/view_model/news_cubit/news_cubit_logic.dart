import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/news_bean/news_bean.dart';
import 'package:flutter_task/model/repos/news_repo/news_repo.dart';
import 'package:flutter_task/view_model/news_cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> news = [];

  int pageNumber = 1;

  getNews() {
    emit(NewsLoadState());
    NewsRepo.getAllNews(params: {'page': pageNumber, 'limit': 7}).then((value) {
      print("News From News Cubit Value Length --> " + value.length.toString());
      value.length == 0 ? news : news += value;

      print("News From News Cubit --> " + value[0].id);
      emit(NewsSuccessState());
    }).catchError((error) {
      print("Error in NewsCubit Logic " + error.toString());
      emit(NewsErrorState());
    });
  }

  void changePageNumber() {
    pageNumber++;
  }

  void resetPageNumber() {
    pageNumber = 1;
  }
}
