
import 'dart:async';
import 'package:codes_thinkers/backgroundimage.dart';
import 'package:codes_thinkers/screens/splash.dart';
import 'package:flutter/material.dart';
class SplashScreenmain extends StatefulWidget {
  const SplashScreenmain({super.key});

  @override
  State<SplashScreenmain> createState() => _SplashScreenmainState();
}
class _SplashScreenmainState extends State<SplashScreenmain> {

@override
  void initState() {
  super.initState();
  Timer(const Duration(seconds: 4),
  (){
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>const Splash()));
  });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
  
  body: Center( 
     child:  Container(
       height: MediaQuery.sizeOf(context).height * 2,
        width: MediaQuery.sizeOf(context).width * 2,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/images/background thinker.jpg',
                  
                    ),
                fit:BoxFit.fill, )),

     child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
        child: Container(
           margin: EdgeInsets.only(top: 100),
          height: 200,width: 400,
          child:Image.asset('assets/images/logo.png'),
           
            ),
        ),
     Container(
                        margin: const EdgeInsets.only(top: 3),
                      width: 210,height: 50,
                      decoration: const BoxDecoration(             
                         color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.elliptical(30, 50),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.elliptical(30, 50),),

                      boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-1, 12),
                          blurRadius: 55,
                          spreadRadius: 1
                          ),
                    ],
              ),
                   child: const Center(
                     child: Text('Welcome',
                      style: TextStyle(
                       fontSize: 35,color: Colors.white,
                       fontWeight: FontWeight.normal,
                      fontFamily: 'Bobbers',)
                                   ),
                   ),
              ),
              Container(
                     width: 197,height: 50,
                      decoration:  const BoxDecoration(             
                         color: Colors.yellow, 
                       borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 70),
                      bottomLeft: Radius.circular(40),
                      topRight: Radius.elliptical(30, 70),
                      bottomRight: Radius.circular(40),
                      ),
                    
                      boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-1, 12),
                          blurRadius:55,
                          spreadRadius: 1
                          ),
                    ],
              ),
                   child: const Center(
                     child: Text('Student Management App',
                      style: TextStyle(
                       fontSize: 15,color: Colors.black,
                       fontWeight: FontWeight.normal,
                      fontFamily: 'Bobbers',)
                                   ),
                   ),
              ),
         Row(
                    children: [
                      Center(
                        child: Container(margin: EdgeInsets.only(left: 350,top: 50),
                          child: ElevatedButton(
                           onPressed: () {
                     Navigator.push(
                     context,
                    MaterialPageRoute(builder: (context) => Splash()),
          );
        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                          ),
                          child: const Text(
                            'Get started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Roboto',
                            ),
                          ),
                                          ),
                        ),
                      ),
                    ],
                  ),
                  ]), )) ,) ;
     
   
        
         
                                  
                               
                  
             
              
      
  
  }
}