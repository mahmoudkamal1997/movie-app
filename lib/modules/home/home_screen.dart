import 'package:movie_app/modules/movie_details/movie_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/shared/cubit/movie_cubit.dart';
import 'package:movie_app/shared/cubit/movie_states.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> MovieCubit()..getSuggestionMovies()..getAllMovies(),
      child: BlocConsumer<MovieCubit,MovieStates>(
        listener: (context,state){},
        builder:  (context,state){
          MovieCubit cubit = MovieCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Movie App'),
            ),
            body: cubit.moviesList == null || cubit.suggestionList ==null? Center(child: CircularProgressIndicator() ) : Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Most Popular",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                        SizedBox(height: 20,),
                        Container(
                          height: 300,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (ctx,index) =>BuildItemListHorizental(context,cubit.suggestionList[index]),
                            separatorBuilder:(ctx,index) => SizedBox(width: 10,) ,
                            itemCount:cubit.suggestionList.length,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("All Movies",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                        SizedBox(height: 20,),
                        ListView.separated(
                          itemBuilder: (ctx,index) => BuildItemListVertical(context,cubit.moviesList[index]),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder:(ctx,index) => SizedBox(height: 10,) ,
                          itemCount: cubit.moviesList.length,
                        ),

                      ]


                  ),
                ),
              ),

          );
        },
      ),
    );
  }

  Widget BuildItemListHorizental(context,model){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MoiveDetailsScreen(model)));
      },
      child: Card(
        elevation: 10,
        color: HexColor('151B54'),
        child: Container(
          width: 200,
          child: Column(
            children: [
              Image(
                image: NetworkImage('${model['medium_cover_image']}'),
                height: 240,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Text(
                  '${model["title_english"]}',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                  maxLines: 2,
                  overflow:
                  TextOverflow.ellipsis,
                  textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildItemListVertical(context,model){

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MoiveDetailsScreen(model)));
      },
      child: Card(
        elevation: 10,
        color: HexColor('151B54'),
        child: Container(
          height: 200,
          child: Row(
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('${model['large_cover_image']}'),
                    fit: BoxFit.cover,
                ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '${model["title_english"]}',
                          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                      ),
                      Text('Category: ${model["genres"][0]}',style: TextStyle(fontSize: 18,color: Colors.grey),),
                      SizedBox(height: 10,),
                      Text('year: ${model["year"]}',style: TextStyle(fontSize: 18,color: Colors.grey),),
                      SizedBox(height: 10,),
                      Row(
                        children:[
                          Text('${model["rating"]}',style: TextStyle(fontSize: 24,color: Colors.yellowAccent),),
                          SizedBox(width: 10,),
                          SmoothStarRating(
                            isReadOnly: true,
                            starCount: 5,
                            size: 20.0,
                            rating: model["rating"]/2,
                          )
                        ]
                      )
                    ],
                  ),
                ),
              ),
            ],

          )
        ),
      ),
    );

  }
}
