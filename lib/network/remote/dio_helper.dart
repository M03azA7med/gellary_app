import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
   static Dio dio=Dio();
  static init(){
    dio=Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://flutter.prominaagency.com/api/'
      ),
    );
  }

   static Future<Response> getdate({
     required String url,
     required Map<String, dynamic> query,
})async
  {
    return await
    dio.get(url,
      queryParameters:query,
    );

  }
}



// // static Dio dio =Dio();
// // static init() {
// //   dio = Dio(
// //     BaseOptions(
// //       baseUrl: 'https://student.valuxapps.com/api/',
// //       receiveDataWhenStatusError: true,
// //       headers: {
// //         'Content-Type':'application/json',
// //       }
// //     ),
// //   );
// // }
// // static Future<Response> getData({
// //   required String url,
// //   required Map<String, dynamic> query,
// // }) async
// // {
// //   return await dio.get(
// //     url,
// //     queryParameters: query,
// //   );
// }
//
// static Future<Response> PostData({
//   required String url,
//   // Map<String, dynamic>? query,
//   required Map<String, dynamic> data,
// }) async
// {
//   return await dio.post(
//     url,
//     data: data,
//     // queryParameters: query,
//   );
// }
