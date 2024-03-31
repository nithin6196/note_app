import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_constants.dart';

class NoteScreenController {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController desController = TextEditingController();
  static TextEditingController dateController = TextEditingController();

  static List<Color> colorList = [
    ColorConstants.clr1,
    ColorConstants.clr2,
    ColorConstants.clr3,
    ColorConstants.clr4,
  ];

  static List notesList = [];

  static void addNote(
      {required String title,
      required String des,
      required String date,
      int clrIndex = 0}) {
    notesList.add({
      "title": title,
      "description": des,
      "date": date,
      "colorIndex": clrIndex,
    });
  }

  static void deleteNote(int index) {
    notesList.removeAt(index);
  }

  static void editNote(
      {required int index,
      required String title,
      required String des,
      required String date,
      int clrIndex = 0}) {
    notesList[index] = {
      "title": title,
      "description": des,
      "date": date,
      "colorIndex": clrIndex,
    };
  }
}
