import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/screen/cubit/states.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../../network/remote/dio_helper.dart';

class loadimageCubit extends Cubit<loadimageStates>{


  loadimageCubit():super(loadimageInitialstate());
  static loadimageCubit get(context)=>BlocProvider.of(context);
  ImagePicker imagePicker=ImagePicker();
  List<XFile> pickerimage=[];
  String selectedImagePath = '';
  //
  // Future<void>pickerCamer()async {
  //   try{
  //     XFile ? image= await imagePicker.pickImage(
  //       source:ImageSource.camera,
  //     );
  //     if(image==null){
  //       emit(loadimageLodingstate());
  //       pickerimage.add(image!,);
  //
  //     }else{
  //       pickerimage=[image];
  //       emit(loadimagesuccess());
  //     }
  //   }catch(error){
  //     print(error.toString());
  //
  //
  //   }
  //
  // }
  // Future<void>pickerGellary()async {
  //   try{
  //     List<XFile>images= await imagePicker.pickMultiImage();
  //     if(images!=null){
  //
  //       emit(loadimageLodingstate());
  //       pickerimage.addAll(images);
  //       print(pickerimage);
  //
  //     }else{
  //       pickerimage=images;
  //       emit(loadimagesuccess());
  //
  //       print("///////////////////***********");
  //       print(images.toString());
  //     }
  //   }catch(e) {
  //     print("///////////////////");
  //     print(e);
  //   };
  // }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      emit(loadimagesuccess());
      return file.path;

    } else {
      return '';
    }
  }
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }


  List<dynamic> image = [];
  void getimages()
  {
    emit(loadimageLodingstate());

    if(image.length == 0)
    {
      DioHelper.getdate(
        url: 'my-gallery',
        query:
        {

        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        print('image==========');
        image = value.data['images'];
        print(image[0]);

        emit(loadimagesuccess());
      }).catchError((error){
        print(error.toString());
        emit(loadimageError(error.toString()));
      });
    } else
    {
      emit(loadimagesuccess());
    }
  }



}