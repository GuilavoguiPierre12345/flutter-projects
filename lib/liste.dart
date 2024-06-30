import 'package:flutter/material.dart';
import 'package:liste_grille_app/data/data_source.dart';
import 'package:liste_grille_app/details.dart';
import 'package:liste_grille_app/place.dart';

class Liste{
  List<Place> places = DataSource().allPlaces(); // les donnees
  ListView buildListeView() {
    return ListView.separated(
      itemCount: places.length,
      separatorBuilder: (context,index) {return const Divider();},
      itemBuilder: (context,index) {
        final currentPlace = places[index];
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(child: Text("${index+1}"),),
                Text(currentPlace.name,
                  textAlign: TextAlign.start,
                ),
                Image.asset(currentPlace.getFolderPath(),width: 100,),
              ],
            ),
            onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (BuildContext context)=> PlaceDetail(place: currentPlace)));
            },
          )
        );
      },
    );
  }
  
}
