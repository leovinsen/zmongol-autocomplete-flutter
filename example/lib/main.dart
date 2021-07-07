import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ime_mongol_package/data/mongol_words_repository.dart';
import 'package:ime_mongol_package/mongol_autocomplete_service.dart';
import 'package:mongol/mongol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mongol Autocomplete Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _service = InputMethodService();
  bool _isInitializing = true;
  bool _isLoading = false;
  List<String> _words = [];
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _service.initialize().then((value) {
      _isInitializing = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24.0),
        child: _isInitializing
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            _isLoading ? null : _suggestWords(controller.text),
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('generate'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('count: ${_words.length}'),
                  SizedBox(
                    height: 12.0,
                  ),
                  Expanded(
                    child: _buildWrappedWords(),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildWrappedWords() {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 16,
        children: _words
            .map((str) => MongolText(
                  str,
                  style: TextStyle(
                    fontFamily: 'z52haratig',
                    fontSize: 24,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildWordsList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        var str = _words[index];
        return MongolText(
          str,
          style: TextStyle(
            fontFamily: 'z52haratig',
            fontSize: 24,
          ),
        );
      },
      separatorBuilder: (_, index) => SizedBox(
        width: 4.0,
      ),
      itemCount: _words.length,
    );
  }

  void _suggestWords(str) {
    setState(() {
      _isLoading = true;
    });
    _service.makeWord(str).then((words) {
      setState(() {
        _words = words;
        _isLoading = false;
      });
    });
  }
}
