import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Welcome to Flutter",
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final suggestions = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  final saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kenta'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemBuilder: buildItem,
    );
  }

  Widget buildItem(BuildContext context, int i) {

    if (i.isOdd) return Divider();
    final index = i ~/ 2;
    if (index >= suggestions.length) {
      suggestions.addAll(generateWordPairs().take(10));
    }
    return buildRow(suggestions[index]);
  }

  Widget buildRow(WordPair pair) {

    final alreadySaved = saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: buildMaterialPageRoute,
      )
    );
  }

  Widget buildMaterialPageRoute(context) {
    final tiles = saved.map(
            (pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: biggerFont,
            ),
          );
        }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Saved suggestions')),
      body: ListView(children: divided),
    );
  }
}
