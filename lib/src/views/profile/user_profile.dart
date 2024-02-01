import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_colors.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/const/custom_button.dart';
import 'package:multisign_app/src/views/auth_view/login_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        ksizedbox10w,
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Divider(
                    height: 1,
                  ),
                  ksizedbox10,
                  Image.asset(
                    'assets/images/Ellipse 40.png',
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'User Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        //ksizedbox10,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: TextField(
                            //  controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Prakash Mp',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Handle edit icon pressed
                                  // You can perform actions such as clearing the text or navigating to a different screen
                                  //     _controller.clear();
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                            ),
                          ),
                        ),
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Email ID',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        //ksizedbox10,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: TextField(
                            //  controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'prakashmp@gmail.com',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Handle edit icon pressed
                                  // You can perform actions such as clearing the text or navigating to a different screen
                                  //     _controller.clear();
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                            ),
                          ),
                        ),
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        //ksizedbox10,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: TextField(
                            //  controller: _controller,
                            decoration: InputDecoration(
                              hintText: '+91 98765 43210',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Handle edit icon pressed
                                  // You can perform actions such as clearing the text or navigating to a different screen
                                  //     _controller.clear();
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                            ),
                          ),
                        ),
                        ksizedbox20,
                        CustomElevatedButton(
                          height: 45,
                          width: 1,
                          onPressed: () {
                            //   Get.to(BottomNaviBar());
                            // ProfileUpdateModel profileUpdateModel =
                            // ProfileUpdateModel(
                            // email: emailController.text,
                            // mobilenumber: mobileController.text,
                            // name: nameController.text);
                            // profileController.updateprofile(profileUpdateModel: profileUpdateModel);
                            // profileController.isEdited(true);
                            // profileController.update();
                            // Get.back();
                          },
                        
                          color: AppColors.green,
                          textColor: Colors.white, child: customtext(text: 'Update'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ksizedbox10,
            InkWell(
              onTap: () {
                _showLogoutDialog(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout),
                            ksizedbox10w,
                            Text('Logout')
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout ?'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 36,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(.20)),
                    child: Center(child: Text('Cancel')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(LoginScreen());
                  },
                  child: Container(
                    height: 36,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.green),
                    child: Center(
                        child: Text(
                      'Log Out',
                      style: TextStyle(color: AppColors.white),
                    )),
                  ),
                ),
              ],
            ),
            ksizedbox20
          ],
        );
      },
    );
  }
}
