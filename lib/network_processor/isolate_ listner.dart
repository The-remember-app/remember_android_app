

import 'package:collection/collection.dart';

import '../src/domain_layer/providers/isolates/network.dart';

class IsolateMessageListener{
  static final IsolateMessageListener instance = IsolateMessageListener._internal();

  IsolateMessageListener._internal();

  factory IsolateMessageListener() {
    return instance;
  }

  final Map<CrossIsolatesMessageType, List<QueueList<CrossIsolatesMessage>>> queries =
  {for (var i in CrossIsolatesMessageType.values) i: []};

  Future<void> mainListener(dynamic message)async{
    CrossIsolatesMessage incomingMessage = message as CrossIsolatesMessage;
    for (QueueList q in queries[incomingMessage.msgType] ?? <QueueList>[]){
      q.addLast(message);
    }
  }

  Stream<CrossIsolatesMessage<T>> getMessageStream<T>(
      CrossIsolatesMessageType targetMsType) async *{
    QueueList<CrossIsolatesMessage> createdNewList = QueueList<CrossIsolatesMessage>();
    queries[targetMsType] ??= [];
    queries[targetMsType]!.add(createdNewList);

    while (true){
      for (var i in createdNewList){
        yield (i as CrossIsolatesMessage<T>);
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

}