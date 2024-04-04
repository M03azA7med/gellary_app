import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/screen/cubit/cubit.dart';
import 'package:gellary_app/screen/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';

import '../class/Frostedglass.dart';


class CustomDialg extends StatelessWidget {
  const CustomDialg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loadimageCubit(),
      child: BlocConsumer<loadimageCubit,loadimageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Dialog(
            child: Container(
              child:  FrostedGlassBox(
                theHeight: 230.0,
                theWidth: 277.0,
                theChild:Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Container(
                        width: 145,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: HexColor('#EFD8F9')
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            loadimageCubit.get(context).selectImageFromCamera();
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Image.asset('images/gallery.png'),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Gellary',style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        width: 145,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: HexColor('#EFD8F9')
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            loadimageCubit.get(context).selectImageFromGallery();
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Image.asset('images/camera.png',width: 40,),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Camera',style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
