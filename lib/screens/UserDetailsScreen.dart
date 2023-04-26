import 'package:flutter/material.dart';

import '../models/models.dart';

class UserDetailsScreen extends StatelessWidget {
  final Result user;
  const UserDetailsScreen({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image(
            image: NetworkImage(user.picture!.large.toString()),
            fit: BoxFit.cover,
          ),
          Text(getUserName(user),
              style: const TextStyle(
                  color: Colors.brown,
                  backgroundColor: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: 20),
          Text(user.email.toString(),
              style: TextStyle(
                  color: Colors.brown,
                  backgroundColor: Colors.white)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Gender: " + user.gender.toString(),
                  style: TextStyle(
                      color: Colors.brown,
                      backgroundColor: Colors.white),
                  textAlign: TextAlign.center),
              Text("Age: ${user.dob?.age}",
                  style: TextStyle(
                      color: Colors.brown,
                      backgroundColor: Colors.white)),
            ],
          ),
          ElevatedButton(
              onPressed: () {
               _sendDataBack(context,user);
              },
              child: const Text("Close")),
        ],
      ),
    );
  }

  void _sendDataBack(BuildContext context,Result user) {
    user.name!.first  = "Hassan";
    user.name!.last  = "Mirza";
    print("modifiedUSerrr = " + user.toString());
    Navigator.pop(context, user);
  }

  String getUserName(Result user) {
    return user.name!.title.toString() + " " +
        user.name!.first.toString() + " " +
        user.name!.last.toString();
  }
}
