import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/user_bean/user_bean.dart';
import 'package:flutter_task/model/repos/user_repo/user_repo.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  late UserBean userBean;

  late List<UserData> users = [];

  int pageNumber = 2;

  getUser() {
    emit(UserLoadState());
    UserRepo.getUserResponse(params: {'page': pageNumber}).then((value) {
      print("Done ---> " + value.toString());
      UserRepo.getUserResponse(params: {}).then((value) {
        print("Lenght " + value.data.length.toString());
        userBean = value;
        users.addAll(value.data);
        emit(UserSuccessState());
      });
    }).catchError((error) {
      print("Error in User Cubit Logic " + error.toString());
      emit(UserErrorState());
    });
  }

  void changePageNumber() {
    pageNumber++;
  }

  void resetPageNumber() {
    pageNumber = 1;
  }
}
