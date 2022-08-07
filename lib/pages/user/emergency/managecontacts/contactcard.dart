import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactcard extends StatefulWidget {
  var contactname;
  var contactnum;

  contactcard({
    this.contactname,
    this.contactnum,
  });

  @override
  State<contactcard> createState() =>
      __contactcardState(contactname, contactnum);
}

class __contactcardState extends State<contactcard> {
  var contactname;
  var contactnum;

  __contactcardState(
    this.contactname,
    this.contactnum,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 33,
                    )),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$contactname',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      '$contactnum',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
