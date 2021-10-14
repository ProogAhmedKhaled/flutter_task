abstract class ContactState {}

class SettingInitialState extends ContactState {}

class SettingImagePickedLoadState extends ContactState {}

class SettingImageSuccessLoadState extends ContactState {}

class SettingImageErrorLoadState extends ContactState {
  dynamic error;

  SettingImageErrorLoadState(this.error);
}

class SettingImageSuccessConvertState extends ContactState {}

class SettingImageErrorConvertState extends ContactState {}
class ContactLoadState extends ContactState{}
class ContactSuccessState extends ContactState{}
class ContactErrorState extends ContactState{}