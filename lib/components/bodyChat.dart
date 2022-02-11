import 'package:chat/components/audioMessage.dart';
import 'package:chat/components/inputField.dart';
import 'package:chat/components/textMessage.dart';
import 'package:chat/components/videoMessage.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class BodyChat extends StatelessWidget {
  const BodyChat();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
                itemCount: demoChatMessages.length,
                itemBuilder: (context, index) => Messages(
                      message: demoChatMessages[index],
                    )),
          ),
        ),
        InputField(),
      ],
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({Key key, @required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContain(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(
            message: message,
          );
          break;
        case ChatMessageType.video:
          return VideoMessage(message: message);
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage("assets/images/user.png")),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContain(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key key, this.status}) : super(key: key);

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.1);
          break;
        case MessageStatus.viewed:
          return kPrimaryColor;
          break;
        default:
          return Colors.transparent;
      }
    }

    return Container(
        margin: EdgeInsets.only(left: kDefaultPadding / 2),
        height: 12,
        width: 12,
        decoration:
            BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
        child: Icon(status == MessageStatus.not_sent ? Icons.close : Icons.done,
            size: 8, color: Theme.of(context).scaffoldBackgroundColor));
  }
}
