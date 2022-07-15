import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
void main() {
  runApp(login());
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var Email;

  var password;

  var _error;
  late Timer _timer;


  bool validator() {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.17,
                      color: Colors.blue,
                      child: Center(
                        child: Text("Sehat Diary",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    showAlert(),
                    SizedBox(height: 100),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(children: [
                        CircleAvatar(
                          radius: 40,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.health_and_safety),
                                SizedBox(height: 5),
                                Text(
                                  "Sehat",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            enableSuggestions: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name can't be empty";
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 216, 230, 255),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                            onChanged: (value) {
                              Email = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a valid password";
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 216, 230, 255),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot Password?",
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: TextButton(
                                onPressed: () async {

                                  setState(() {});
                                  if(validator())
                                  {
                                    try {
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: Email, password: password)
                                          .then((value) => Navigator.pushNamed(
                                              context, "Firebasecard"));
                                    } on FirebaseAuthException catch (e) {


                                      setState(() {
                                        _error = e.message;
                                      });
                                      print(e);
                                    }
                                  }
                                },
                                child: Text("Login",
                                    style:
                                        TextStyle(color: Colors.white, fontSize: 20)),
                              ),
                            )),

                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DO NOT HAVE AN ACCOUNT",
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "signup");
                          },
                          child: Text("SIGN UP",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ]),
            ),
        ),

      ),
    );
  }

  // Stream<User?> get userstate {
  //   return _auth.authStateChanges().map((User? user) => _userfromFirebaseUser(user!));
  // }

  // Users? _userfromFirebaseUser(User? user) {
  //   return user != null ? Users(user.uid) : null;
  // }
  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined),
            ),
            Text("$_error"),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }


}
