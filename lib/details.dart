import 'package:flutter/material.dart';
import 'package:liste_grille_app/place.dart';

class PlaceDetail extends StatefulWidget {
    const PlaceDetail({super.key,required this.place});
    final Place place;

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.place.name),),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Card(
                  elevation: 20,
                  color: Colors.brown[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(widget.place.getFolderPath()),
                  ),
              ),
              const SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.place.desc,style: const TextStyle(fontSize: 20),),
              ),
          ],
        ),
      ),
    );
  }
}
