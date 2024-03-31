// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_app/controller/notes_screen_controller.dart';
import 'package:share_plus/share_plus.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.clrIndex,
    this.onDeletePressed,
    this.onEditPressed,
  });
  final String title;
  final String description;
  final String date;
  final int clrIndex;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: NoteScreenController.colorList[clrIndex],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              InkWell(onTap: onEditPressed, child: Icon(Icons.edit)),
              SizedBox(width: 15),
              InkWell(onTap: onDeletePressed, child: Icon(Icons.delete))
            ],
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                  child: Icon(Icons.share))
            ],
          )
        ],
      ),
    );
  }
}
