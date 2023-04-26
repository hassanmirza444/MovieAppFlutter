import 'package:api_calling_in_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => MovieScreenState();
}

class MovieScreenState extends State<MovieScreen> {

  List<Movie> movies = [];
  int page = 1;
  final scrollcontroller = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Movies")),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        controller: scrollcontroller,
        itemCount: isLoadingMore ? movies.length + 1 : movies.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0),
        itemBuilder: (context, index) {
          if (index < movies.length) {
            final Movie mymovie = movies[index] as Movie;
            return Container(
              margin: const EdgeInsets.all(2),
              height: 2700,
              width: 1500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amberAccent),
              child: GridTile(
                // ignore: sort_child_properties_last
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.network(mymovie.banner.toString(),width: 1500,height: 2700, fit: BoxFit.fitWidth)),
                    ),
                    Expanded(flex: 3, child: Text(mymovie.name.toString(), maxLines: 1 ,softWrap: true,textAlign: TextAlign.center,)),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        },
      ),
    );
  }

  Future<void> fetchUsers() async {

    const url = 'http://dooo.risenexpress.com/api/get_movie_list.php?page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri,headers: {"x-api-key": "1ScDo85kOqgNZnrA"});
    final body = response.body;
    List<dynamic> root = json.decode(body);
    setState(() {
      movies.addAll(root.map((job) => Movie.fromJson(job)).toList());
    });
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context, Result user, int index) {}
}

