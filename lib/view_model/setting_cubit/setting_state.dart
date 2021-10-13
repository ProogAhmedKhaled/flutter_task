abstract class SettingState {}

class SettingInitialState extends SettingState {}

class SettingImagePickedLoadState extends SettingState {}

class SettingImageSuccessLoadState extends SettingState {}

class SettingImageErrorLoadState extends SettingState {
  dynamic error;

  SettingImageErrorLoadState(this.error);
}

class SettingImageSuccessConvertState extends SettingState {}

class SettingImageErrorConvertState extends SettingState {}
