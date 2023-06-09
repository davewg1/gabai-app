import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gabai/app/chat_message.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final String _api = "http://192.168.1.3:8000/api";

  @override
  void initState() {
    super.initState();
    _sendMessage(justUpdate: true);
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _sendMessage(justUpdate: true);
    });
  }

  void _sendMessage({bool justUpdate = false}) {
    if (_controller.text.isEmpty && justUpdate != justUpdate) return;

    // Insert chat bot response here
    Future<http.Response> response;
    if (justUpdate) {
      response = http.post(Uri.parse("$_api/chat"));
    } else {
      var newMessage = {"author": 'Mobile User', "content": _controller.text};
      var headers = <String, String>{'Content-Type': 'application/json'};
      var body = jsonEncode(newMessage);
      response =
          http.post(Uri.parse("$_api/chat"), headers: headers, body: body);
      _controller.clear();
    }

    response.then((value) {
      List messages = jsonDecode(value.body);
      var newMessages = messages.map((message) {
        String sender = message["author"];
        String text = message["content"];
        return ChatMessage(text: text, sender: sender);
      });
      newMessages = newMessages.toList().reversed;
      setState(() {
        _messages.clear();
        _messages.addAll(newMessages);
      });
    });
  }

  // Bottom Row
  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: const InputDecoration.collapsed(
              hintText: "Send a message",
            ),
          )),
          IconButton(
              onPressed: () => _sendMessage(), icon: const Icon(Icons.send)),
        ],
      ),
    );
  }

  // Messages
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.chat_bubble,
              size: 40,
            ),
          ),
          Text('Chat'),
        ]),
        shape: const Border(
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(12.0),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    })),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}