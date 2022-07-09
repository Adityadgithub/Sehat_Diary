import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                        return null;
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
                        labelText: "Email address",
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
                        return null;
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
                        labelText: "Password",
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
                            try {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: Email, password: password)
                                  .then((value) => Navigator.pushNamed(
                                      context, "Firebasecard"));
                            } on FirebaseAuthException catch (e) {
                              print("e");
                            }
                          },
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      )),
                  SizedBox(height: 20),
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton(
                        onPressed: () {
                          signinAnon().then((value) =>
                              Navigator.pushNamed(context, 'profilepage'));
                        },
                        child: Center(
                          child: Text(
                            "Guest",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ))
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
    );
  }

  // Stream<User?> get userstate {
  //   return _auth.authStateChanges().map((User? user) => _userfromFirebaseUser(user!));
  // }

  // Users? _userfromFirebaseUser(User? user) {
  //   return user != null ? Users(user.uid) : null;
  // }


  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e);
    }
  }
}
