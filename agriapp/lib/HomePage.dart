import 'package:agriapp/navigation/plantdetect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:agriapp/navigation/resource.dart';
import 'package:agriapp/navigation/googlemaps.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:agriapp/navigation/agriInfo.dart';
import 'package:snappable/snappable.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<CameraDescription> cameras;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin= false;

  checkAuthentification() async{

    _auth.authStateChanges().listen((user) { 

      if(user ==null)
      {
        Navigator.pushReplacementNamed(context, "Start");
      }
    });
  }

  getUser() async{

    User firebaseUser =  _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if(firebaseUser !=null)
    {
      setState(() {
        this.user =firebaseUser;
        this.isloggedin=false;
      });
    }
  }

  signOut()async{

    _auth.signOut();
     final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState(){
  super.initState();
    this.checkAuthentification();
    this.getUser();
    
  }
  
 final _key1 = GlobalKey<SnappableState>();
final _key2 = GlobalKey<SnappableState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("AGRI APP INFORMATION"),
backgroundColor: Colors.green,),
drawer: Drawer(elevation: 16.0,
child: Column(
  children: <Widget>[
         DrawerHeader(
           child: Image.asset("assets/222.jpg",height: 250,width: 500,fit: BoxFit.fitWidth,)),

  
      
      Divider(
      height:0.1,
    ),
    ListTile(
      title:Text('sharing information'),
       onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> ResourcePage()));
      },
      leading: Icon(Icons.message_outlined)
    ),
   
      
    Divider(
      height:0.1,
    ),
      ListTile(
      title:Text('Image Recognisition'),
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>  PlantDetect()));
      },
      leading: Icon(Icons.map_outlined)
    ),
    Divider(
      height:0.1,
    ),
      ListTile(
      title:Text('Agriculture crops information'),
       onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> Agriinfo()));
       },
      leading: Icon(Icons.mobile_friendly)
    ),
    Divider(
      height:0.1,
    ),
RaisedButton(

               padding: EdgeInsets.fromLTRB(50,10,50,10),
                      onPressed: signOut,
                      child: Text('Signout',style: TextStyle(

                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                      
                      )),

                      color: Colors.green,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(23.0),
                      ),
            ),
                 Divider(
      height:0.1,
    ),
         IconButton(
              icon: Icon(Icons.arrow_right_alt_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
             ),
    
  ]
),
),

      body:Container(
         child: !isloggedin
          ? SingleChildScrollView(child: Column(
        
        children: [
          Container(
            child:Stack(
              children: [
                Container(
            height: 250,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white70,
            child:Container(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Agriculture Information', style: TextStyle(color: Colors.green,fontSize: 22.0),),
                SizedBox(height:10),
                Text('Agriculture describes the practice of growing crops or raising animals. Someone who works as a farmer is in the agriculture industry. The Latin root of agriculture is agri, or "field," plus cultura, "cultivation." Cultivating a piece of land, or planting and growing food plants on it, is largely what agriculture means',style: TextStyle(fontSize: 18.0),),
              ],
            ),
            )
            ),
        Snappable(
            key: _key1,
              child:Container(
                height: 250,
                width: 500,
                alignment: Alignment.center,
                color: Colors.white12,
               child: Image.asset('assets/44.jpg',height: 250,width: 500,fit: BoxFit.fitWidth,)
              
              
              ),
            snapOnTap: true,
          ),
          SizedBox(height: 5,),
          Snappable(
            key: _key2,
            child:Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white12,
               child: Text("Welcome to our App",style: TextStyle(fontSize: 20,color:Colors.white,)),
              
            ),
            snapOnTap: true,
          ),
              ],
            )
          ),
            
          
          SizedBox(height: 5,),
          RaisedButton(
            child: Text('view'),
              onPressed: (){
                SnappableState state1 = _key1.currentState;
                SnappableState state2 = _key2.currentState;
                if(state2.isGone && state1.isGone){
                  state1.reset();
                  state2.reset();
                }else{
                  state1.snap();
                  state2.snap();
                }
              }
          ),
          SizedBox(height:20),
          Text('Agriculture in India',style: TextStyle(fontSize: 24,color: Colors.green),),
          SizedBox(height:15),
          Container(
            child:Text('India  agriculture is composed of many crops, with the foremost food staples being rice and wheat. Indian farmers also grow pulses, potatoes, sugarcane, oilseeds, and such non-food items as cotton, tea, coffee, rubber, and jute (a glossy fiber used to make burlap and twine). India is a fisheries giant as well. A total catch of about 3 million metric tons annually ranks India among the world top 10 fishing nations. Despite the overwhelming size of the agricultural sector, however, yields per hectare of crops in India are generally low compared to international standards. Improper water management is another problem affecting India agriculture. At a time of increasing water shortages and environmental crises, for example, the rice crop in India is allocated disproportionately high amounts of water. One result of the inefficient use of water is that water tables in regions of rice cultivation, such as Punjab, are on the rise, while soil fertility is on the decline. Aggravating the agricultural situation is an ongoing Asian drought and inclement weather. Although during 2000-01 a monsoon with average rainfall had been expected, prospects of agricultural production during that period were not considered bright. This has partially been due to relatively unfavorable distribution of rainfall, leading to floods in certain parts of the country and droughts in some others.Despite the fact that agriculture accounts for as much as a quarter of the Indian economy and employs an estimated 60 percent of the labor force, it is considered highly inefficient, wasteful, and incapable of solving the hunger and malnutrition problems. Despite progress in this area, these problems have continued to frustrate India for decades. It is estimated that as much as one-fifth of the total agricultural output is lost due to inefficiencies in harvesting, transport, and storage of government-subsidized crops.',style: TextStyle(fontSize: 18,),textAlign: TextAlign.justify),   
          ),
          SizedBox(height:24),
          Container(
            height:280,
            width:500,
            color: Colors.green,
            child:ListView(
              children: <Widget>[
        SizedBox(height: 20.0),
        CarouselSlider(
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
         autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
          ),
          items: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rice Cultivation',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'West Bengal is the largest rice producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ragi Cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Maharastra is the largest ragi producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Wheat Cultivation',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Punjab is the largest wheat producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cotton Cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Gujarat is the largest cotton producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Rubber Cultivation',
style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Kerala is the largest rubber producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z6.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sugarcane Cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'uttar pradesh is the largest sugarcane producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z7.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Maize Cultivation',
                 style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Karnataka is the largest maize producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z8.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cashew nut Cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Maharastra is the largest cashew nut producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                          backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Jute Cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Assana and Bihar is the largest jute producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                         backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/z10.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ground nut cultivation',
                   style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                      fontSize: 18.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Gujarat is the largest groundnut producing state in India',
                      style: TextStyle(
                        color: Colors.yellow,
                        backgroundColor: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),


          ],
           ),


      ],
            )
          )
        
                ],
      ),
      
                     
          
    )
          :Container( 
          child: Text(
                    "Hello your are check your email and password",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
            ),
      ),
      
    floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMaps()) ),
      tooltip: 'Google Map',
      hoverColor: Colors.green,
      child: Icon(Icons.pin_drop_outlined),
      ),
    floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,  
    );
  }
}