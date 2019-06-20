import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            color: Colors.purple,
            onPressed: () {
            showSearch(context: context, delegate: SearchResult());
            },)
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class SearchResult extends SearchDelegate<String> {

  final recentCities = [
    'são luis',
    'imperatriz',
    'conduru',
    'joao lisboa'
  ];
  final cities = [
    'pinheiro',
    'paris',
    'codó',
    'pio XII'
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      },),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation),
        onPressed: () {
      close(context, null);
        } );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.book),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

}
