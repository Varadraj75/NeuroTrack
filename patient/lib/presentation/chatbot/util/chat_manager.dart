import 'dart:async';
import 'package:patient/core/core.dart';
import 'package:patient/presentation/chatbot/util/data_formatters/activity_data_formatter.dart';
import 'package:rxdart/rxdart.dart';
import 'intent_detector.dart';

enum ChatMessageType { user, chatbot, typing }
class ChatMessageModel {
  final String text;
  final ChatMessageType type;
  const ChatMessageModel(this.text, this.type);
}

class ChatManager {
  static final ChatManager _instance = ChatManager._internal();
  ChatManager._internal();
  static ChatManager get instance => _instance;

  final List<ChatMessageModel> _messages = <ChatMessageModel>[];
  final BehaviorSubject<List<ChatMessageModel>> _messageController = BehaviorSubject<List<ChatMessageModel>>.seeded([]);

  Stream<List<ChatMessageModel>> get messageStream => _messageController.stream;

  void addMessage(String text, ChatMessageType type) {
    _messages.add(ChatMessageModel(text, type));
    _messageController.add(List<ChatMessageModel>.unmodifiable(_messages));
  }

  void sendResponseFromChatbot(String input) async {
    addMessage('Stub response', ChatMessageType.chatbot);
  }
}
