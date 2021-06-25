
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agriapp/navigation/user.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:agriapp/navigation/infowindow.dart';
import 'package:provider/provider.dart';
class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  
  GoogleMapController mapController;
  Set<Marker> _markers=Set<Marker>();
  final LatLng _center =LatLng(9.309297762347876, 78.4652344101111);
  final double _zoom =15.0;
  final Map<String, User>_userList={
"Rice":User(
  'Rice1',
  'Rice',
  'assets/rice.jpg',
  LatLng(10.220883311889498, 78.37932068101061)
),
"Rice1":User(
  'Rice2',
  'Rice', 
  'assets/rice.jpg',
  LatLng(10.737147681435758, 79.6162180817996)
),
"Rice2":User(
  'Rice3',
  'Rice', 
  'assets/rice.jpg',
  LatLng(9.309297762347876, 78.4652344101111)
),
"Rice3":User(
  'Rice4',
  'Rice', 
  'assets/rice.jpg',
  LatLng(10.111878720945123, 77.58688606160895)
),
"Rice4":User(
  'Rice5',
  'Rice', 
  'assets/rice.jpg',
  LatLng(22.454456569860763, 87.30452945136133)
),
"Rice5":User(
  'Rice6',
  'Rice', 
  'assets/rice.jpg',
  LatLng(23.224388190699877, 87.09497474629394)
),
"Rice6":User(
  'Rice7',
  'Rice', 
  'assets/rice.jpg',
  LatLng(30.242063736817393, 75.81926808262241)
),
"Rice7":User(
  'Rice8',
  'Rice', 
  'assets/rice.jpg',
  LatLng(31.297446174278765, 75.61152555861888)
),
"wheat":User(
  'Wheat1',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(30.383664755819613, 76.3833021009638)
),
"wheat1":User(
  'Wheat2',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(30.90643892853258, 75.79856334684776)
),
"wheat2":User(
  'Wheat3',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(25.51575111635236, 80.33194468917262)
),
"wheat3":User(
  'Wheat4',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(28.6457511260884, 79.79685002715402)
),
"wheat4":User(
  'Wheat5',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(29.37525286788013, 76.92394957048876)
),
"wheat5":User(
  'Wheat6',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(30.38397086571896, 76.73279425740269)
),
"wheat6":User(
  'Wheat7',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(22.727903927162174, 77.75679991507363)
),
"wheat7":User(
  'Wheat8',
  'Wheat', 
  'assets/wheat.jpg',
  LatLng(27.22956175338962, 73.71422176238129)
),
"maize1":User(
  'Maize1',
  'Maize', 
  'assets/maize.jpg',
  LatLng(25.47790626030551, 80.35516189003263)
),
"maize2":User(
  'Maize2',
  'Maize', 
  'assets/maize.jpg',
  LatLng(24.263877978412477, 84.40615347089664)
),
"maize3":User(
  'Maize3',
  'Maize', 
  'assets/maize.jpg',
  LatLng(21.47526662512096, 83.96150994797928)
),
"maize4":User(
  'Maize4',
  'Maize', 
  'assets/maize.jpg',
  LatLng(24.76476448736288, 85.03014531576112)
),
"maize5":User(
  'Maize5',
  'Maize', 
  'assets/maize.jpg',
  LatLng(17.966790996105242, 79.56736282427555)
),
"maize6":User(
  'Maize6',
  'Maize', 
  'assets/maize.jpg',
  LatLng(14.390717291896863, 79.99993010963352)
),
"maize7":User(
  'Maize7',
  'Maize', 
  'assets/maize.jpg',
  LatLng(26.73273287340452, 83.40356564370686)
),
"jute1":User(
  'Jute1',
  'Jute', 
  'assets/jute.jpg',
  LatLng(22.336209451034083, 75.39925554735403)
),
"jute2":User(
  'Jute2',
  'Jute', 
  'assets/jute.jpg',
  LatLng(24.72667305726865, 73.35723115150564)
),
"jute3":User(
  'Jute3',
  'Jute', 
  'assets/jute.jpg',
  LatLng(29.716160357106183, 77.7106728857667)
),
"jute4":User(
  'Jute4',
  'Jute', 
  'assets/jute.jpg',
  LatLng(21.535046886575063, 70.47347569636291)
),
"jute5":User(
  'Jute5',
  'Jute', 
  'assets/jute.jpg',
  LatLng(22.30136617599857, 69.66941380515954)
),
"jute6":User(
  'Jute6',
  'Jute', 
  'assets/jute.jpg',
  LatLng(25.88734246488798, 85.78300379297728)
), 
"sugarcane1":User(
  'sugarcane1',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(18.90307899008502, 74.25920969429772)
),
"sugarcane2":User(
  'sugarcane2',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(29.15486295185761, 77.4868149705476)
),
"sugarcane3":User(
  'sugarcane3',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(28.425300818975607, 79.65105718072303)
),
"sugarcane4":User(
  'sugarcane4',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(22.942255568625733, 79.0734126704162)
),
"sugarcane5":User(
  'sugarcane5',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(11.77273534842215, 78.08493521443478)
),
"sugarcane6":User(
  'sugarcane6',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(10.89681844162298, 78.49757426839714)
),
"sugarcane7":User(
  'sugarcane7',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(16.424871525085425, 74.96137102592903)
),
"sugarcane8":User(
  'sugarcane8',
  'Sugarcane', 
  'assets/sugarcane.jpg',
  LatLng(20.0625286747564, 84.65930014495585)
),
"Ragi1":User(
  'ragi1',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(12.389664028522946, 76.64160682121432)
),
"Ragi2":User(
  'ragi2',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(14.030128579706627, 75.57376037688122)
),
"Ragi3":User(
  'ragi3',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(22.336209451034083, 75.39925554735403)
),
"Ragi4":User(
  'ragi4',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(16.50709915713324, 80.58325652975657)
),
"Ragi5":User(
  'ragi5',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(11.307162040499461, 77.75998581269077)
),
"Ragi7":User(
  'ragi7',
  'Ragi', 
  'assets/ragi.jpg',
  LatLng(13.73938083503233, 79.43887739809556)
),
"Rupper1":User(
  'rupper1',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(9.339317131699023, 77.05673203895758)
),
"Rupper2":User(
  'rupper2',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(11.457144822958172, 76.41952502461737)
),
"Rupper3":User(
  'rupper3',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(10.52966985740628, 76.17782581228141)
),
"Rupper4":User(
  'rupper4',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(10.118949724716543, 76.48544299161807)
),
"Rupper5":User(
  'rupper5',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(9.108896577218289, 76.92913773742258)
),
"Rupper6":User(
  'rupper6',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(8.577688898045281, 77.5834573404043)
),
"Rupper7":User(
  'rupper7',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(10.31160367207816, 78.13277373207688)
),
"Rupper9":User(
  'rupper9',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(24.137805033690352, 92.20959069805649)
),
"Rupper10":User(
  'rupper10',
  'Rupper', 
  'assets/rubber.jpg',
  LatLng(23.44512524816361, 91.41410754158998)
),
"cashew1":User(
  'cashewnut1',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(11.767099442403234, 79.55195827821468)
),
"cashew2":User(
  'cashewnut2',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(11.659914518269723, 79.48207387025474)
),
"cashew3":User(
  'cashewnut3',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(17.36516924791146, 82.73036605073995)
),
"cashew4":User(
  'cashewnut4',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(13.533383918779938, 79.98776619540939)
),
"cashew5":User(
  'cashewnut5',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(9.002525325689179, 76.7126679444135)
),
"cashew6":User(
  'cashewnut6',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(15.84594415407538, 73.64461627030269)
),
"cashew7":User(
  'cashewnut7',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(15.887594928073954, 73.83487374755846)
),
"cashew8":User(
  'cashewnut8',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(12.992886282381788, 75.04911914143273)
),
"cashew9":User(
  'cashewnut9',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(12.948576983683301, 74.82203669725335)
),
"cashew10":User(
  'cashewnut10',
  'Cashewnut', 
  'assets/cashew.jpg',
  LatLng(8.525922226631083, 76.95848464647663)
),
"Cotton1":User(
  'cotton1',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(22.399233989800436, 70.76085439811867)
),
"Cotton2":User(
  'cotton2',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(23.047777521881304, 72.61205063805535)
),
"Cotton3":User(
  'cotton3',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(21.39517021692346, 72.8976951617251)
),
"Cotton4":User(
  'cotton4',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(18.04026299150454, 79.87234810850467)
),
"Cotton5":User(
  'cotton5',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(19.035004592793186, 80.00418404250614)
),
"Cotton6":User(
  'cotton6',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(29.76028767660741, 74.33767088712541)
),
"Cotton7":User(
  'cotton7',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(24.872195912936323, 74.0630126912891)
),
"Cotton8":User(
  'cotton8',
  'Cotton', 
  'assets/cotton.jpg',
  LatLng(29.846934567128333, 76.39359988528685)
),
"Groundnut1":User(
  'groundnut1',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(13.644725823853506, 78.25792132794729)
),
"Groundnut2":User(
  'groundnut2',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(10.59606798564014, 78.55023545675216)
),
"Groundnut3":User(
  'groundnut3',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(11.214207595895198, 77.43830686840005)
),
"Groundnut4":User(
  'groundnut4',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(15.717559391082768, 75.71204372716169)
),
"Groundnut5":User(
  'groundnut5',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(17.827510425904133, 80.72195639487974)
),
"Groundnut6":User(
  'groundnut6',
  'Groundnut', 
  'assets/groundnut.jpg',
  LatLng(19.29183318049344, 77.30535559148468)
),
  };
  final double _infowindowwidth=240;
  final double _markeroffset=160;
  @override
  Widget build(BuildContext context) {
    final providerObject=Provider.of<Infowindow>(context, listen: false);
    _userList.forEach((key, value) {
      _markers.add(Marker(markerId: MarkerId(value.username),
      position: value.location,
      onTap: (){
        providerObject.updateInfowindow(context, mapController, value.location, _infowindowwidth, _markeroffset);
        providerObject.updateUser(value);
        providerObject.updateVisibility(true);
        providerObject.rebuildInfowindow();
      }));
    });
    return Scaffold(
      appBar: AppBar(title: Text('google maps'),),
      body: Container(
        child: Consumer<Infowindow>(
          builder: (context, model, child){
            return Stack(children: [
              child,
              Positioned(
                left: 0,
                top: 0,
                child: Visibility(visible:providerObject.showInfowindow,
              child: (providerObject.user==null || !providerObject.showInfowindow)?Container():Container(margin: EdgeInsets.only(left:providerObject.leftMargin,
              top:providerObject.topMargin), child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                    gradient:LinearGradient(colors: [Colors.white,Color(0xfffceef5)],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    ),
                    boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(0.0,1.0),
                    blurRadius: 6.0),]
                    ),
                    height: 115,
                    width: 250,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Image.asset(providerObject.user.image,height:50,),
                        SizedBox(width:12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(providerObject.user.name, style: TextStyle(fontSize:16,
                            fontWeight:FontWeight.bold,
                            color:Colors.black),
                            ),
                            FlatButton(onPressed: (){}, child: Text("view more"),
                            color: Colors.green,
                            textColor: Colors.white,)
                          ]
                        )

                      ]
                    ),
                  
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color:Color(0xfffceef5),
                      width: 20.0,
                      height: 15.0,
                    )
                  )
                ],
              ),
              ),
              ),
              ),
            ],
            );
          },
          child:Positioned(
        child:GoogleMap(
          onTap: (position){
            if(providerObject.showInfowindow){
              providerObject.updateVisibility(false);
              providerObject.rebuildInfowindow();
            }
           
          },
          onCameraMove: (position){
            if(providerObject.user!=null){
              providerObject.updateInfowindow(context, mapController, providerObject.user.location, _infowindowwidth, _markeroffset);
              providerObject.rebuildInfowindow();
            }
          },
          onMapCreated: (GoogleMapController controller){
            mapController=controller;
          },
          markers: _markers,
        initialCameraPosition: CameraPosition(target: _center,
      zoom: _zoom),
        ),
          ),
      ),
      ),
    );
  }
}
