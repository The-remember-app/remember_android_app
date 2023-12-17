

class IsolateMessageListener{
  static final IsolateMessageListener instance = IsolateMessageListener._internal();

  IsolateMessageListener._internal();

  factory IsolateMessageListener() {
    return instance;
  }

  final Map<, List<>> queries = {};

}