import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/beans/contact_bean/contact_bean.dart';
import 'package:flutter_task/model/repos/contact_repo/contact_repo.dart';
import 'package:flutter_task/view_model/setting_cubit/contact_state.dart';
import 'package:image_picker/image_picker.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(SettingInitialState());

  // get Singleton  object from this setting cubit
  static ContactCubit get(context) => BlocProvider.of(context);

  XFile? image;

  String imageBase64 = "";

  Future<dynamic> postMessage(ContactBean contactBean) async {
    late dynamic id;
    emit(ContactLoadState());
    await ContactRepo.postMessage(contactBean.toJson()).then((value) {
      print("Data ===> " + value.data['id']);
      id = value.data['id'];
      emit(ContactSuccessState());
    }).catchError((error) {
      print("Error in cubit post " + error.toString());
      emit(ContactErrorState());
    });
    print("ID " + id.toString()) ;
    return id;
  }

  Future<void> uploadImage() async {
    emit(SettingImagePickedLoadState());
    final ImagePicker _picker = ImagePicker();
    print("image Picker");
    await _picker.pickImage(source: ImageSource.gallery).then((value) {
      image = value;

      emit(SettingImageSuccessLoadState());
    }).catchError((error) {
      emit(SettingImageErrorLoadState(error));
    });
  }

  Future<String> convertImageToBase64() async {
    List<int> fileInByte = await image!.readAsBytes();
    imageBase64 = base64Encode(fileInByte);
    return imageBase64;
  }
}
