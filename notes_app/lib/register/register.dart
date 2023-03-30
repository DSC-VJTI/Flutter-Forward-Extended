import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_theme.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
                  "Get On Board!",
                  style: NotesTheme.appText(
                      size: width / 12, weight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Create your profile to start your Journey.",
                  style: NotesTheme.appText(
                      size: width / 22,
                      weight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        cursorColor: NotesTheme.highlightColor,
                        style: NotesTheme.appText(
                            size: width / 24,
                            weight: FontWeight.normal,
                            color: NotesTheme.whiteColor),
                        decoration: NotesTheme.waInputDecoration(
                            hint: "Name",
                            fontSize: width / 24,
                            prefixIcon: CupertinoIcons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: width,
                      child: TextFormField(
                        cursorColor: NotesTheme.highlightColor,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return "Email is not valid";
                          }
                          return null;
                        },
                        style: NotesTheme.appText(
                            size: width / 24,
                            weight: FontWeight.normal,
                            color: NotesTheme.whiteColor),
                        decoration: NotesTheme.waInputDecoration(
                            hint: "Email",
                            fontSize: width / 24,
                            prefixIcon: CupertinoIcons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: width,
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        cursorColor: NotesTheme.highlightColor,
                        obscureText: true,
                        style: NotesTheme.appText(
                            size: width / 24,
                            weight: FontWeight.normal,
                            color: NotesTheme.whiteColor),
                        decoration: NotesTheme.waInputDecoration(
                            hint: "Password",
                            fontSize: width / 24,
                            prefixIcon: Icons.fingerprint),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width / 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: width,
                    height: 60,
                    child: ElevatedButton(
                        style: NotesTheme.buttonStyle(
                            backColor: NotesTheme.highlightColor),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading1 = true;
                            });
                          }
                        },
                        child: isLoading1
                            ? SizedBox(
                                height: width / 20,
                                width: width / 20,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: NotesTheme.backgroundColor,
                                ),
                              )
                            : Text(
                                "SIGNUP",
                                style: NotesTheme.appText(
                                    size: width / 23,
                                    weight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: NotesTheme.slightBlack),
                              )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: NotesTheme.appText(
                          size: width / 27,
                          weight: FontWeight.w600,
                          color: NotesTheme.whiteColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "LOGIN",
                        style: NotesTheme.appText(
                            size: width / 27,
                            weight: FontWeight.bold,
                            color: NotesTheme.highlightColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}