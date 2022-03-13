import 'package:flutter/material.dart';
import 'package:lost_n_found/models/chartmessage.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage message;

  const AudioMessage({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue.withOpacity(message.isSender ? 1 : 0.5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : Colors.green,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: message.isSender
                        ? Colors.white
                        : Colors.green.withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: message.isSender ? Colors.white : Colors.green,
                          shape: BoxShape.circle,
                        )),
                  )
                ],
              ),
            ),
          ),
          Text(
            "0.49",
            style: TextStyle(
                fontSize: 12, color: message.isSender ? Colors.green : null),
          ),
        ],
      ),
    );
  }
}
