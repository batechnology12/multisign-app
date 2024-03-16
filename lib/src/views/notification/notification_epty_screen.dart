import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multisign_app/src/const/app_fonts.dart';
import 'package:multisign_app/src/views/notification/notification.dart';

class EmptyNotification extends StatefulWidget {
  const EmptyNotification({super.key});

  @override
  State<EmptyNotification> createState() => _EmptyNotificationState();
}

class _EmptyNotificationState extends State<EmptyNotification> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                // onTap: () {
                //   Get.to(NotificationScreen());
                // },
                child: Image.asset('assets/images/fi_10932587.png')),
            ksizedbox20,
            Text(
              '''You're all caught up''',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text('Come back later for Reminders, Prints model'),
            Text(' and banners notifications'),
          ],
        ),
      ),
    );
  }
}
