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
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddNewNoteSheet(),
          );
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
              itemBuilder: (context, index) => NoteCard(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: NoteScreenController.notesList.length)),
    );
  }
}
