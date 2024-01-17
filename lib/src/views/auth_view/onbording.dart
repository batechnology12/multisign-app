import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/image 1.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  'assets/images/logo 1.png',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          child: Image.asset('assets/images/Group 107.png'),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 2,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('''Get latest printing all''',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('brands in your shops banners',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              ],
                            ),ksizedbox20,Text('''
It was popularised in the 1960s with the release of 
Letraset sheets containing Lorem Ipsum passages, 
and more recently with desktop publishing software 
like Aldus PageMaker including versions of Lorem Ipsum.''',)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
