import 'package:flutter/material.dart';

void main() {
  runApp(
    FriendlyChatApp(),
  );
}

String _name = 'Thomas';

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 36, 42, 117),
          secondary: Colors.white,
          surface: Colors.purpleAccent,
          background: Colors.grey,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.deepOrange,
          onSurface: Colors.brown,
          onBackground: Colors.grey,
          onError: Colors.redAccent,
          brightness: Brightness.light,
        ),
      ),
      home: ChatScreen(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name, style: Theme.of(context).textTheme.headline4),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FriendlyChat')),
      body: _buildTextComposer(),
    );
  }

  // methode privée qui retourne un container constitué d'un champ de texte et d'un bouton
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.primary),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Send a message'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              )
            ],
          )),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}