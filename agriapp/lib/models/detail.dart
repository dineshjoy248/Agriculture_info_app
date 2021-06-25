import 'package:flutter/material.dart';
import 'data.dart';
import 'constants.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        FittedBox(child: Image.asset(planetInfo.iconImage),
                        fit: BoxFit.fill),
                        
                          Divider(color: Colors.black38),
                        SizedBox(height: 30),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        
                        Text(
                          'Agriculture Crops Information',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 18,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      'Photos',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child:Image.asset(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                   Divider(color: Colors.black38),
                        SizedBox(height: 30),

                   Text(
                          planetInfo.cou,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                         SizedBox(height: 20),
                        ExpansionTile(
                title: Text(planetInfo.name),
                subtitle: Text(planetInfo.subname),
                trailing: Icon(Icons.add_to_queue),
                backgroundColor: Colors.limeAccent,
                children: [
                  Column(
                  
                    children: [
                      
                    Padding(padding: EdgeInsets.all(15),),
                      Text(planetInfo.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,color: Colors.green),),
                      Padding(padding: EdgeInsets.all(5),),
                       Text(planetInfo.cro),
                        Padding(padding: EdgeInsets.all(15),),
                        Text('CLIMATE AND SOIL',textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,color: Colors.green),),
                         Padding(padding: EdgeInsets.all(5),),
                        Text(planetInfo.climate),
                        Padding(padding: EdgeInsets.all(15),),
                         Table(
                          
                           border:TableBorder.all(),
                           children:[
                            TableRow(children:[
                              
                               Text('Growth stages',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                               Text('Temperature requirement',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),)
                             ]),
                             TableRow(children:[
                               Text(planetInfo.c1),
                               Text(planetInfo.r1)
                             ]),
                              TableRow(children:[
                               Text(planetInfo.c2),
                               Text(planetInfo.r2)
                             ]),
                              TableRow(children:[
                               Text(planetInfo.c3),
                               Text(planetInfo.r3),
                             ]),
                              TableRow(children:[
                               Text(planetInfo.c4),
                               Text(planetInfo.r4)
                             ]),
                           ]
                         ) ,
                          Padding(padding: EdgeInsets.all(15),),
                         Text('Land Preparation:',textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,color: Colors.green),),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.land),
                         Padding(padding: EdgeInsets.all(15),),
                         Text('Varieties',textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,color: Colors.green),),
                         Padding(padding: EdgeInsets.all(8),),
                         Text(planetInfo.variety1,style: TextStyle(fontSize: 14.0,color: Colors.green)),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.varlist1),
                         Padding(padding: EdgeInsets.all(8),),
                         Text(planetInfo.variety2,style: TextStyle(fontSize: 14.0,color: Colors.green),),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.varlist2),
                         Padding(padding: EdgeInsets.all(15),),
                        Text('Plant Disease Control:',textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,color: Colors.green),),
                        Padding(padding: EdgeInsets.all(10),),
                        Table(
                           border:TableBorder.all(),
                           children:[
                        TableRow(children:[
                          
                               Text('Name of disease',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                               Text('Preventive measures',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                               Text('Name of chemicals',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                               Text('Rate',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                            
                             ]
                             ),
                             TableRow(children:[
                               Text(planetInfo.pd),
                               Text(planetInfo.pd2),
                               Text(planetInfo.pd3),
                               Text(planetInfo.pd4)
                             ]),
                              TableRow(children:[
                               Text(planetInfo.pd1),
                               Text(planetInfo.pd12),
                               Text(planetInfo.pd13),
                               Text(planetInfo.pd14)
                             ]),
                              TableRow(children:[
                               Text(planetInfo.pd02),
                               Text(planetInfo.pd22),
                               Text(planetInfo.pd23),
                               Text(planetInfo.pd24)
                             ]),
                           ]
                        ),
                        Padding(padding: EdgeInsets.all(15),),
                         Text('Harvesting and Storage',style: TextStyle(fontSize: 16.0,color: Colors.green),),
                         Padding(padding: EdgeInsets.all(8),),
                         Text(planetInfo.har,style: TextStyle(fontSize: 14.0,color: Colors.green)),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.har1),
                         Padding(padding: EdgeInsets.all(8),),
                         Text(planetInfo.yie,style: TextStyle(fontSize: 14.0,color: Colors.green)),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.yie),
                        Padding(padding: EdgeInsets.all(8),),
                         Text(planetInfo.sto,style: TextStyle(fontSize: 14.0,color: Colors.green,)),
                          Padding(padding: EdgeInsets.all(5),),
                         Text(planetInfo.sto1),

                    ]
                      )
                        
                ],
                
              ),
          SizedBox(height: 20),
    
                        ],
              )
              
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
