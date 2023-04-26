import 'package:api_calling_in_flutter/providers/FetchUsersProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'UserDetailsScreen.dart';
import 'dart:convert';

class FetchUsersScreenWithProvider extends StatefulWidget {
  const FetchUsersScreenWithProvider({Key? key}) : super(key: key);

  @override
  State<FetchUsersScreenWithProvider> createState() =>
      _FetchUsersScreenWithProviderState();
}

class _FetchUsersScreenWithProviderState
    extends State<FetchUsersScreenWithProvider> {
  List<Result?>? users = [];
  int page = 1;
  bool isLoadingMore = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListner);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FetchUsersProvider>(context,listen: false).getAllUsers(page);
    });


    // fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Api Calling")),
        body: Consumer<FetchUsersProvider>(builder: (context, value, child) {
          users!.addAll(value.getUsers);
          return ListView.builder(
            padding: EdgeInsets.all(12),
            controller: scrollController,
            itemCount: isLoadingMore ? users!.length + 1 : users!.length,
            itemBuilder: (context, index) {
              if (index < users!.length) {
                final Result user = users![index] as Result;
                final userName = getUserName(user);
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amberAccent),
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child:
                            Image.network(user.picture!.thumbnail as String)),
                    title: Text(userName),
                    subtitle: Text(user.email.toString()),
                    trailing: const Icon(Icons.navigate_next),
                    textColor: Colors.black,
                    iconColor: Colors.blue,
                    onTap: () {
                      showMyBottomSheet(context, user, index);
                    },
                    onLongPress: () {
                      _awaitReturnValueFromSecondScreen(context, user, index);
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }));
  }

  void showMyBottomSheet(BuildContext context, Result user, int index) {
    showBottomSheet(
        context: context,
        enableDrag: true,
        backgroundColor: Colors.red,
        elevation: 20,
        builder: (context) {
          return Container(
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
                        color: Colors.brown, backgroundColor: Colors.white)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Gender: " + user.gender.toString(),
                        style: TextStyle(
                            color: Colors.brown, backgroundColor: Colors.white),
                        textAlign: TextAlign.center),
                    Text("Age: ${user.dob?.age}",
                        style: TextStyle(
                            color: Colors.brown,
                            backgroundColor: Colors.white)),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close")),
              ],
            ),
          );
        });
  }

  void _awaitReturnValueFromSecondScreen(
      BuildContext context, Result user, int index) async {
    final modifiedUSer = await (Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserDetailsScreen(user: user))));
    setState(() {
      print("modifiedUSer = " + modifiedUSer.toString());
      users![index] = modifiedUSer;
    });
  }

  String getUserName(Result user) {
    return user.name!.title.toString() +
        " " +
        user.name!.first.toString() +
        " " +
        user.name!.last.toString();
  }

  void _scrollListner()  {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = false;
      });
      print("scroll end");
      page = page + 1;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<FetchUsersProvider>(context,listen: false).getAllUsers(page);
      });
      setState(() {
        isLoadingMore = false;
      });
    }
  }
}
