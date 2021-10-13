import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/view_model/setting_cubit/setting_state.dart';
import 'package:image_picker/image_picker.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitialState());

  // get Singleton  object from this setting cubit
  static SettingCubit get(context) => BlocProvider.of(context);

  XFile? image;

  String imageBase64 = "";

  void uploadImage() async {
    emit(SettingImagePickedLoadState());
    final ImagePicker _picker = ImagePicker();
    print("image Picker") ;
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
