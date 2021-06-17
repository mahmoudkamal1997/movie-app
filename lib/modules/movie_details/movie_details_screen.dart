import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MoiveDetailsScreen extends StatelessWidget {
  final Map model;

  const MoiveDetailsScreen(this.model);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('${model['medium_cover_image']}'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Movie Name: ${model["title_english"]} ',
                style: TextStyle(fontSize: 28,color: Colors.yellowAccent),
                maxLines: 2,
                overflow:
                TextOverflow.ellipsis,
                textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Card(
                elevation: 10,
                color: HexColor('2B3856'),
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('year: ${model["year"]}',style: TextStyle(fontSize: 22,color: Colors.grey),),
                      Row(
                        children: [
                          Text('${model["rating"]}',style: TextStyle(fontSize: 24,color: Colors.yellowAccent),),
                          SizedBox(width: 5,),
                          Icon(Icons.star,color: Colors.yellowAccent,)
                        ],
                      ),
                      Text('Size: ${model["torrents"][0]['size']}',style: TextStyle(fontSize: 22,color: Colors.grey),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
               Text('Description: ', style: TextStyle(fontSize: 28,color: Colors.yellowAccent)),
              SizedBox(height: 15,),
              Text('${model["description_full"]}',style: TextStyle(fontSize: 22,color: Colors.grey,wordSpacing: 1,height: 1.5),),


            ],
          ),
        ),
      ),
    );
  }
}
