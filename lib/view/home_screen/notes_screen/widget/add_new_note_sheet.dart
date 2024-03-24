// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_app/controller/notes_screen_controller.dart';
import 'package:note_app/core/constants/color_constants.dart';

class AddNewNoteSheet extends StatefulWidget {
  const AddNewNoteSheet({super.key});

  @override
  State<AddNewNoteSheet> createState() => _AddNewNoteSheetState();
}

class _AddNewNoteSheetState extends State<AddNewNoteSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.lightGrey,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Note",
              style: TextStyle(
                color: ColorConstants.normalWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Title",
                fillColor: ColorConstants.textFieldColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Description",
                fillColor: ColorConstants.textFieldColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Date",
                  fillColor: ColorConstants.textFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.calendar_month_sharp,
                      color: ColorConstants.normalBlack,
                    ),
                  )),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                  (index) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    NoteScreenController.addNote();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
