import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_networking_review/model/photohome_model.dart';
import 'package:flutter_networking_review/model/searchphotos_model.dart';
import 'package:flutter_networking_review/model/topic_model.dart';
import '../networking/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotoHome> items = [];
  List<Topic> topic = [];
  String? id = "18HwWLgd4ps";
  String page = "1";
  String query = "car";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_apiPostList(page);
    //_apiRelatedPhotos(id!);
    //_apiSearchPhotos(page, query);
    //_apiSearchUsers(page, query);
    _apiGetTopic(page,"20");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photo"),
        ),
        body: GridView.count(
          padding: EdgeInsets.only(top: 20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: topic.map((item) => itemOfList1(item)).toList(),
        ));
  }

  Widget itemOfList(PhotoHome photo) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(2.5),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        photo.urls!.regular.toString()
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              photo.description.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget itemOfList1(Topic photo) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(2.5),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        photo.coverPhoto.urls.regular
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              photo.description.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

//Get Photos
/*  void _apiPostList(String page) {
    Network.getPhotos(Network.API_PHOTOS, Network.paramsGetPhotos(page))
        .then((response) => {_showResponse(response!)});
  }*/

  //Get Related Photos
/*  void _apiRelatedPhotos(String id){
    Network.GetRelatedPhotos(Network.API_RELATED(id))
        .then((response) => {
       _showResponse(response!)
    });
  }*/

  //Get search photos
/*  void _apiSearchPhotos(String pages, String query){
    Network.getSearchPhotos(Network.API_SEARCH, Network.paramsSearch(page, query))
        .then((response) => {
          _showResponse(response!)
    });
  }*/

  //Get Search Users
/*  void _apiSearchUsers(String page, String query) {
    Network.getSearchUsers(
            Network.API_SEARCH_USERS, Network.paramsSearchUsers(page, query))
        .then((response) => {_showResponse(response!)});
  }*/

  //Get Topic
  void _apiGetTopic(String page, String per_page){
    Network.getTopic(Network.API_TOPIC, Network.paramsTopic(page, per_page))
        .then((response) => {
          _showResponse(response!)
    });
  }

  void _showResponse(String response) {
    //Get Photos
    //List<PhotoHome> photoHome = Network.parsePhotoHome(response);

    //Get Related Photos
    //List<PhotoHome>? relatedPhotos = Network.parseRelatesPhotos(response);

    //Get Search Photos
    //List<PhotoHome> searchPhotos = Network.parseSearchPhotos(response);

    //Get Search Users
    //List<PhotoHome> searchUsers = Network.parseSearchUsers(response);

    //Get Topic
    List<Topic> topic = Network.parseTopic(response);

    setState(() {
      //items = relatedPhotos;
      //items = photoHome;
      //items = searchPhotos;
      //items = searchUsers;
      topic = topic;
    });
  }
}
