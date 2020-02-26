import 'dart:io';

abstract class IImagePicker{


  Future<File> pickerImageFromGallery();
}