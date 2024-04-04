import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_app/screen/cubit/cubit.dart';
import 'package:gellary_app/screen/cubit/states.dart';
import 'package:gellary_app/screen/login.dart';
import 'package:hexcolor/hexcolor.dart';
import '../const_widget/CustomDialg.dart';

class homeScreens extends StatelessWidget {
   homeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => loadimageCubit()..getimages()    ,
      child: BlocConsumer<loadimageCubit,loadimageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return  Scaffold(
            body:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        HexColor('#DDCDFF'),
                        HexColor('#EA94D7'),
                        Colors.white
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      transform: GradientRotation(0)
                  )
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Welcome \nMina',style: TextStyle(
                                fontSize: 25
                            ),),
                            Image.asset('images/user.png')
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 145,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: Colors.white
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginScreen(),));
                                    },
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('images/logout.png'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Log out',style: TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Stack(
                                children:[
                                  Column(
                                    children: [
                                      Container(
                                        width: 145,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(11),
                                            color: Colors.white
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            loadimageCubit.get(context).getimages();
                                            showDialog(context: context,
                                              builder: (context) => CustomDialg(),);
                                          },
                                          shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Image.asset('images/Upload.png'),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text('Upload',style: TextStyle(color: Colors.black)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: Container(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 10
                              ),
                              itemBuilder: (context,index){
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage('images/gellary1.png'),
                                      )
                                  ),
                                );
                              },
                              itemCount: 100,
                            ),
                          ),
                        ),
                      ],
                    )],
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
