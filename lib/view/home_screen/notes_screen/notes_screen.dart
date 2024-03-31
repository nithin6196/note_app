// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_app/controller/notes_screen_controller.dart';
import 'package:note_app/core/constants/color_constants.dart';
import 'package:note_app/view/home_screen/notes_screen/widget/add_new_note_sheet.dart';
import 'package:note_app/view/home_screen/notes_screen/widget/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NoteScreenController.titleController.clear();
          NoteScreenController.dateController.clear();
          NoteScreenController.desController.clear();
          customBottomSheet(context: context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Notes App",
          style: TextStyle(
            color: ColorConstants.normalWhite,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: ColorConstants.normalBlack,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => NoteCard(
                    title: NoteScreenController.notesList[index]["title"],
                    description: NoteScreenController.notesList[index]
                        ["description"],
                    date: NoteScreenController.notesList[index]["date"],
                    clrIndex: NoteScreenController.notesList[index]
                        ["colorIndex"],
                    onDeletePressed: () {
                      NoteScreenController.deleteNote(index);
                      setState(() {});
                    },
                    onEditPressed: () {
                      NoteScreenController.titleController.text =
                          NoteScreenController.notesList[index]["title"];
                      NoteScreenController.dateController.text =
                          NoteScreenController.notesList[index]["date"];
                      NoteScreenController.desController.text =
                          NoteScreenController.notesList[index]["description"];

                      customBottomSheet(
                          context: context, isEdit: true, index: index);
                    },
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: NoteScreenController.notesList.length)),
    );
  }

  Future<dynamic> customBottomSheet(
      {required BuildContext context, bool isEdit = false, int index = 0}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddNewNoteSheet(
        editIndex: index,
        isEdited: isEdit,
        onComplete: () {
          setState(() {});
        },
      ),
    );
  }
}
