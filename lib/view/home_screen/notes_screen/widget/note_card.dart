// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_constants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorConstants.clr1, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.edit),
              SizedBox(width: 15),
              Icon(Icons.delete)
            ],
          ),
          Text(
            "Description",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Tue, Feb 20, 2024",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(width: 10),
              Icon(Icons.share)
            ],
          )
        ],
      ),
    );
  }
}
