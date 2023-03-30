// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/notes/layout/note_pad_page.dart';
import 'package:notes_app/notes/models/note_model.dart';
import 'package:notes_app/notes/widgets/note_card.dart';
import 'package:notes_app/utils/notes_theme.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<NoteModel> models = [
    NoteModel(
        title: "Attend GDSC Workshop",
        note:
            "Attend GDSC Workshop \nLearn dart basic, install flutter sdk. \n\nhttps://gdsc.community.dev/e/m9724c/",
        description: "Learn dart basic, install flutter sdk.",
        date: "7/4/23",
        note_id: "1"),
    NoteModel(
        title: "Test on Monday",
        note: "Test on Monday \nStudy all the topics covered in BEE",
        description: "Study all the topics covered in BEE",
        date: "7/4/23",
        note_id: "2"),
    NoteModel(
        title: "Important Text",
        note: "Important Text \nMake a Notes app",
        note_id: "3",
        date: "7/4/23",
        description: "Make a Notes app"),
    NoteModel(
      title: "Music",
      note: "Music \nMy Favourite music is ..",
      note_id: "4",
      description: "My Favourite music is ..",
      date: "7/4/23",
    )
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: NotesTheme.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "${models.length} Notes",
              style: NotesTheme.appText(
                  size: width / 30, weight: FontWeight.normal),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                NoteModel? model = await Navigator.push(context,
                    MaterialPageRoute(builder: (_) {
                  return NotePadPage();
                }));
                setState(() {
                  if (model != null) {
                    models.add(model);
                  }
                });
              },
              child: Icon(
                Icons.edit_note,
                color: NotesTheme.highlightColor,
                size: width / 13,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Notes",
              style: NotesTheme.appText(
                  size: width / 11,
                  weight: FontWeight.bold,
                  color: NotesTheme.highlightColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: width / 10,
                    width: width / 10,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: NotesTheme.highlightColor,
                        borderRadius: BorderRadius.circular(width / 20)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: width / 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              child: CupertinoSearchTextField(
                style: NotesTheme.appText(
                  letterSpacing: 0.2,
                  size: width / 24,
                  weight: FontWeight.w400,
                ),
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                placeholder: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                    size: width / 17,
                  ),
                ),
                backgroundColor: NotesTheme.slightBlack,
                placeholderStyle: NotesTheme.appText(
                    letterSpacing: 0.2,
                    size: width / 21,
                    weight: FontWeight.w400,
                    color: Colors.grey),
                onChanged: (value) {},
                onSubmitted: (value) {},
                autocorrect: true,
              ),
            ),
            ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 32),
                    height: 0.28,
                    color: Colors.grey,
                  );
                },
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: models.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          setState(() {
                            models.remove(models[index]);
                          });
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                models.remove(models[index]);
                              });
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () async {
                        NoteModel? model = await Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                          return NotePadPage(
                            model: models[index],
                          );
                        }));
                        setState(() {
                          if (model != null) {
                            models[index] = model;
                          }
                        });
                      },
                      child: NoteCard(
                          isFirst: index == 0,
                          isLast: index == models.length - 1,
                          model: models[index]),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
