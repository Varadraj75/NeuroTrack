import 'dart:async';
import 'package:therapist/core/core.dart';
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
  final StreamController<List<ChatMessageModel>> _messageController = StreamController<List<ChatMessageModel>>.broadcast();

  Stream<List<ChatMessageModel>> get messageStream => _messageController.stream;

  List<ChatMessageModel> get currentMessages => _messages;

  void addMessage(String text, ChatMessageType type) {
    _messages.add(ChatMessageModel(text, type));
    _messageController.add(List<ChatMessageModel>.unmodifiable(_messages));
  }

  void sendResponseFromChatbot(String input, {bool isVoiceMode = false}) async {
    addMessage('Stub response', ChatMessageType.chatbot);
  }
}
