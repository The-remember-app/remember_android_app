import 'dart:isolate';

enum CrossIsolatesMessageType{
  noSet, userAndPassword, loginUserAnsIsolateMsg
}

class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;
  final CrossIsolatesMessageType msgType;

  CrossIsolatesMessage({
    required this.sender,
    required this.message,
    this.msgType = CrossIsolatesMessageType.noSet
  });
}