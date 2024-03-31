// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controller/notes_screen_controller.dart';
import 'package:note_app/core/constants/color_constants.dart';

class AddNewNoteSheet extends StatefulWidget {
  const AddNewNoteSheet(
      {super.key,
      this.onComplete,
      this.isEdited = false,
      required this.editIndex});
  final void Function()? onComplete;
  final bool isEdited;
  final int editIndex;

  @override
  State<AddNewNoteSheet> createState() => _AddNewNoteSheetState();
}

class _AddNewNoteSheetState extends State<AddNewNoteSheet> {
  int selectedClrIndex = 0;

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
              widget.isEdited ? "Update Note" : "Add Note",
              style: TextStyle(
                color: ColorConstants.normalWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: NoteScreenController.titleController,
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
              controller: NoteScreenController.desController,
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
              readOnly: true,
              controller: NoteScreenController.dateController,
              decoration: InputDecoration(
                  hintText: "Date",
                  fillColor: ColorConstants.textFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: InkWell(
                    onTap: () async {
                      final selectedDateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030));
                      if (selectedDateTime != null) {
                        String formatedDate =
                            DateFormat("dd/MM/yyyy").format(selectedDateTime);
                        NoteScreenController.dateController.text =
                            formatedDate.toString();
                      }
                    },
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
                  (index) => InkWell(
                        onTap: () {
                          selectedClrIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: NoteScreenController.colorList[index],
                              borderRadius: BorderRadius.circular(10),
                              border: selectedClrIndex == index
                                  ? Border.all(width: 5)
                                  : Border.all()),
                        ),
                      )),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (widget.isEdited) {
                      NoteScreenController.editNote(
                          index: widget.editIndex,
                          title: NoteScreenController.titleController.text,
                          des: NoteScreenController.desController.text,
                          date: NoteScreenController.dateController.text,
                          clrIndex: selectedClrIndex);
                    } else {
                      NoteScreenController.addNote(
                          title: NoteScreenController.titleController.text,
                          des: NoteScreenController.desController.text,
                          date: NoteScreenController.dateController.text,
                          clrIndex: selectedClrIndex);
                    }

                    Navigator.pop(context);
                    widget.onComplete!();
                  },
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        widget.isEdited ? "Edit" : "Add",
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
