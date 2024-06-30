import 'package:flutter/material.dart';
import 'package:liste_grille_app/data/data_source.dart';
import 'package:liste_grille_app/details.dart';
import 'package:liste_grille_app/place.dart';

class Grid {
  List<Place> places = DataSource().allPlaces();

  GridView buildGridView() {
    return GridView.builder(
      physics:const BouncingScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4
      ),
      itemBuilder: (BuildContext context,int index){
        final currentPlace = places[index];
        return InkWell(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (BuildContext context)=> PlaceDetail(place: currentPlace)));
          },
          child: Card(
            elevation: 7.0,
            child:Column(
              children: [
                Image.asset(currentPlace.getFolderPath(),fit: BoxFit.cover, height: 320.0,),
                const SizedBox(height: 5.0,),
                Text(currentPlace.name,
                  style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                )
              ],
            )
          ),
        );
      },
      itemCount: places.length,
    );
  }

}
