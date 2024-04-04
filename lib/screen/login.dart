import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gellary_app/class/Frostedglass.dart';
import 'package:gellary_app/screen/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';

class loginScreen extends StatelessWidget {
   loginScreen({super.key});
 TextEditingController emailController=TextEditingController();
 TextEditingController passwordController=TextEditingController();

 void login(String email,String password,context) async {

   try{
     Response response=await post(Uri.parse('https://technichal.prominaagency.com/api/auth/login'),
     body: {
       "email":email,
       "password":password
     }
     );
     if(response.statusCode==200){
       print("done");
       Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreens(),));

     }else{
       print('faild');
     }

   }catch(e){
     print('-------------------');
     print(e.toString());
   }
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor('#DDCDFF'),
                HexColor('#EA94D7'),
                Colors.white
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              transform: GradientRotation(0.2)
            )
          ),
          child: SafeArea(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Stack(
                    children: [
                      Image.asset('images/lines.png',height: 130),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
                        child: Image.asset('images/love_photography.png',height: 100),
                      ),
                    ],
                  ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: Text("   My\nGellary",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#4A4A4A') ,
                    ),),
                  ),
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/Rectangle 12.png',height: 180,),
                        Stack(children:[
                          Image.asset('images/Ellipse 33.png',height: 180,width: 190,),
                          Image.asset('images/Union.png',height: 180,)
                          ,]
                        ),

                      ],

                    ),
                    Center(
                      child: Container(
                        child: FrostedGlassBox(
                          theHeight: 345.0,
                          theWidth: 388.0,
                          theChild:Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must be write';
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value){},
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: Text('User Name',style: TextStyle(
                                      color: HexColor('#988F8C')
                                    ),),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),

                                    ),
                                  ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must be write';
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value){},
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: Text('password',style: TextStyle(
                                      color: HexColor('#988F8C')
                                    ),),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),

                                    ),
                                  ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 280,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: HexColor('#7BB3FF'),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: MaterialButton(onPressed: (){
                                    login(
                                      emailController.text.toString(),
                                      passwordController.text.toString(),
                                      context
                                    );
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreens(),));
                                  },
                                    child: Text('SUBMIT',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
