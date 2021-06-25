import 'package:flutter/material.dart';
  import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:agriapp/navigation/resource.dart';
import 'package:intl/intl.dart';
class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _descriptionEditingController=TextEditingController();

  File _imageFile;
  bool _loading=false;

  ImagePicker imagePicker=ImagePicker();

  Future<void> _chooseImage() async{
   PickedFile pickedFile=await imagePicker.getImage(source: ImageSource.gallery,);
   setState(() {
     _imageFile=File(pickedFile.path);
   });
  }

  void _validate(){
    if(_imageFile==null && _descriptionEditingController.text.isEmpty){
      Fluttertoast.showToast(
          msg:"please add image and enter description"
        );

    }else if(_imageFile==null){
      Fluttertoast.showToast(
          msg:"please enter image"
        );

    }
    else if(_descriptionEditingController.text.isEmpty){
        Fluttertoast.showToast(
          msg:"please enter description"
        );
    }
    else{
      setState(() {
        _loading=true;
      });
      _uploadImage();
    } 
  }
  void _uploadImage(){
String imageFileName=DateTime.now().microsecondsSinceEpoch.toString();
final Reference storageReference =FirebaseStorage.instance.ref().child('Images').child(imageFileName);
final UploadTask uploadTask=storageReference.putFile(_imageFile);
uploadTask.then((TaskSnapshot taskSnapshot)=>{
  taskSnapshot.ref.getDownloadURL().then((imageUrl){
_saveData(imageUrl);
  })
}).catchError((error){
  setState(() {
        _loading=false;
      });
  Fluttertoast.showToast(
          msg: error.toString(),
        );
});
  }
  void _saveData(String imageUrl){
    var dateFormat=DateFormat('MMM d, yyy');
    var timeFormat=DateFormat('EEEE, hh:mm a');
    String date=dateFormat.format(DateTime.now()).toString();
    String time=timeFormat.format(DateTime.now()).toString();
    FirebaseFirestore.instance.collection('posts').add({
      'imageUrl':imageUrl,
      'description':_descriptionEditingController.text,
      'date':date,
      'time':time,
    }).whenComplete((){
        setState(() {
        _loading=false;
      });
      Fluttertoast.showToast(msg:'post added sucessfully');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return ResourcePage();
      }));

    }).catchError((error){
      setState(() {
        _loading=false;
      });
      Fluttertoast.showToast(msg: error.toString(),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('upload'),
      ),
      body:SingleChildScrollView(
       child:Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            _imageFile==null ? Container(
              width: double.infinity,
              height: 250.0,
              color: Colors.grey,
              child: Center(child: RaisedButton(onPressed: (){
                _chooseImage();
              },
                color:Colors.green,
              child:Text('choose image',style:TextStyle(fontSize: 16.0,color:Colors.white)))),
            ):GestureDetector(
              onTap: (){
                _chooseImage();
              },
            child:Container(
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_imageFile),
                fit: BoxFit.cover  
              ),
              ),
            ),
            ),
            SizedBox(height:16.0),
            TextField(
              controller:_descriptionEditingController,
            keyboardType:TextInputType.text,
            decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height:40.0),
            _loading ? CircularProgressIndicator(): GestureDetector(
              onTap:_validate,
              child:Container(
                color: Colors.blue,
                width: double.infinity,
                height: 50.0,
                child: Center(
                  child:Text('Add New post',
                  style:TextStyle(fontSize: 18.0,
                  color:Colors.white),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    ),
    );
  }
}