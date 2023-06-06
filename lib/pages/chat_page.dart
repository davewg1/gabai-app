import 'package:flutter/material.dart';

import 'package:gabai/app/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() {
    ChatMessage message = ChatMessage(text: _controller.text, sender: 'user');

    setState(() {
      _messages.insert(0, message);
    });

    _controller.clear();
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
                    padding: const EdgeInsets.all(8.0),
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
