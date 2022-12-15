import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 10, 30),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Column(
              children: [
                Icon(Icons.notifications_none),
                Text(
                  '공지사항',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: [
                Icon(Icons.notifications_none),
                Text(
                  '공지사항',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: [
                Icon(Icons.notifications_none),
                Text(
                  '공지사항',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Column(
              children: [
                Icon(Icons.notifications_none),
                Text(
                  '공지사항',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}