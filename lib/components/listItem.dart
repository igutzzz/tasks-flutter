import 'package:estudos_flutter/main.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;

  const ListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ListNotification(title).dispatch(context);
              },
              splashRadius: 20,
            )
          ],
        ),
        tileColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
