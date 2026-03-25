enum ChatIntent {
  schedule,
  general,
}

extension ChatIntentX on ChatIntent {
  bool get isSchedule => this == ChatIntent.schedule;
  bool get isGeneral => this == ChatIntent.general;
}

class IntentDetector {
  static final IntentDetector _instance = IntentDetector._internal();
  IntentDetector._internal();
  static IntentDetector get instance => _instance;

  static Future<ChatIntent> detectIntent(String userMessage) async {
    return ChatIntent.general;
  }
}