import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_theme.dart';
import 'package:notes_app/register/register.dart';

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Don't have an Account?",
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const Register();
                  // return Register();
                }));
              },
              child: Text(
                "Sign-Up",
                style: NotesTheme.appText(
                    size: width / 27,
                    weight: FontWeight.bold,
                    color: NotesTheme.highlightColor),
              ),
            )
          ],
        ),
      ),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      child: TextFormField(
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
                        cursorColor: NotesTheme.highlightColor,
                        style: NotesTheme.appText(
                            size: width / 24,
                            weight: FontWeight.normal,
                            color: NotesTheme.whiteColor),
                        decoration: NotesTheme.waInputDecoration(
                            hint: "Email",
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
              const SizedBox(
                height: 20,
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

                            isLoading1 = false;
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
                                "LOGIN",
                                style: NotesTheme.appText(
                                    size: width / 23,
                                    weight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: NotesTheme.slightBlack),
                              )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Text(
                      "OR",
                      style: NotesTheme.appText(
                          size: width / 22,
                          weight: FontWeight.bold,
                          color: NotesTheme.whiteColor),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    height: 60,
                    child: ElevatedButton(
                        style: NotesTheme.buttonStyle(
                            backColor: NotesTheme.slightBlack,
                            borderColor: NotesTheme.highlightColor),
                        onPressed: () {
                          setState(() {
                            isLoading2 = true;
                          });
                          isLoading2 = false;
                        },
                        child: isLoading2
                            ? SizedBox(
                                height: width / 20,
                                width: width / 20,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: NotesTheme.highlightColor,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google_icon.png',
                                      height: width / 13, fit: BoxFit.cover),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Sign-In with Google",
                                    style: NotesTheme.appText(
                                        size: width / 25,
                                        weight: FontWeight.w600,
                                        letterSpacing: 0.1,
                                        color: NotesTheme.whiteColor),
                                  ),
                                ],
                              )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
