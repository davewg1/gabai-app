import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});

  final String text;
  final String sender;

  Color chatColor() {
    if (sender == "Mobile User") {
      return Color(0xFF4B92D3);
    } else if (sender == "Auto Mode") {
      return Color(0xFFBB6BD9);
    } else if (sender == "chatgpt") {
      return Color(0xFFEEA63A);
    } else if (sender == "Employee") {
      return Color(0xFF4DCFC0);
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 8,
          left: sender == "Mobile User" ? 170 : 0,
          right: sender == "Mobile User" ? 0 : 170),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: chatColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                        maxLines: 100,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}