import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading1 = false;
  bool isLoading2 = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: NotesTheme.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "NoteIt",
                      textDirection: TextDirection.ltr,
                      style: NotesTheme.appText(
                          letterSpacing: -4,
                          size: width / 6,
                          weight: FontWeight.w900,
                          color: NotesTheme.highlightColor),
                    ),
                    Icon(CupertinoIcons.pencil_outline,
                        size: width / 7, color: NotesTheme.whiteColor)
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Welcome Back,",
                  style: NotesTheme.appText(
                      size: width / 12, weight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Organize your thoughts and ideas",
                  style: NotesTheme.appText(
                      size: width / 22,
                      weight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ),
 
            ],
          ),
        ),
      ),
    );
  }
}
