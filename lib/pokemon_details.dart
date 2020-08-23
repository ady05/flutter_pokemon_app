
import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  final String attack;
  final String defense;
  final String description;

  PokemonDetails(this.attack,this.defense,this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         Card(
           child: Text(attack),
         ),
         Card(
           child: Text(defense),
         ),
         Card(
           child: Text(description),
         )
       ],
     ),
    );
  }
}
