
import 'package:flutter/material.dart';
import 'package:agriapp/navigation/uploadscreen.dart';
import 'package:agriapp/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  Widget _cardUI(Post post){
    return Card(
    margin: EdgeInsets.all(20.0),
    elevation: 10.0,
    child: Container(
      padding:EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post.date,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,
              color: Colors.grey ,
              fontStyle: FontStyle.italic),
            ),
            Text(
              post.time,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,
              color: Colors.grey ,
              fontStyle: FontStyle.italic),
            ),
          ],),
          SizedBox(height:10.0),
          Image.network(post.imageUrl,
          width:double.infinity,
          height:300.0,
          fit:BoxFit.cover),
          SizedBox(height:10.0),
          Text(post.description,
          style: TextStyle(fontSize: 20.0,
              color: Colors.black ),
          ),
        ],
      )
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
appBar: AppBar(title: Text('Information sharing'),
actions: [
  Padding(padding: const EdgeInsets.only(right: 8.0),
  child: GestureDetector(onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UploadScreen()));
  },
  child: Icon(Icons.add,
  color: Colors.white,),
  ),
  ),
],),
body: Container(
  child:StreamBuilder(stream: FirebaseFirestore.instance.collection('posts').snapshots(),
  builder: (context,snapshot){
    if(!snapshot.hasData){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return ListView.builder(itemCount: snapshot.data.docs.length,
      itemBuilder: (context,index){
        Map<String, dynamic> postMap=snapshot.data.docs[index].data();
        Post post=Post(postMap["imageUrl"],
        postMap["description"],
        postMap["date"],
        postMap["time"],
        );
        return _cardUI(post);
      },);
    }
  },),
),
    );
  }
}