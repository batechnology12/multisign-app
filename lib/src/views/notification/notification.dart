import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Notification'),centerTitle: true,),
      body: MyListView(),);
  }
}
class MyListView extends StatelessWidget {
  final List<String> items = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5',
    'User 6',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(radius: 25,
              backgroundColor: Colors.blue,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text('''New Register complete, action
printing models'''),
                 
            onTap: () {
              // Handle item tap if needed
              print('Tapped on ${items[index]}');
            },
          ),
        );
      },
    );
  }
}