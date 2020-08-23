import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pokemon_details.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  Future<List<User>> _getUser() async{
    var data = await http.get('https://pokedex-bb36f.firebaseio.com/pokemon.json');
    var jsonData = json.decode(data.body);

    List<User> users =[];
    for(var u in jsonData){
      User user = User(u['id'],u['attack'],u['defense'],u['description'],u['imageUrl'],u['name']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(snapshot.data[index].imageUrl),
                  ),
                  title: Text(snapshot.data[index].name) ,
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return PokemonDetails(
                          snapshot.data[index].attack,
                          snapshot.data[index].defense,
                          snapshot.data[index].description
                        );
                      }
                    ));
                 },
                );
              });
        }
      ),
    );
  }
}
class User {
  final int id;
  final int attack;
  final int defense;
  final String description;
  final String imageUrl;
  final String name;

  User(this.id,this.attack,this.defense,this.description,this.imageUrl,this.name);
}
