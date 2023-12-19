import 'dart:isolate';

import 'package:isar/isar.dart';
import 'package:the_remember/src/urils/db/abstract_entity.dart';

import '../../../../network_processor/new_network_processor.dart';
import '../../../urils/db/engine.dart';
import '../../../urils/isolate/base_msg.dart';
import '../../../urils/isolate/isolate_ listner.dart';
import '../../../urils/profilers/abstract.dart';

class NetworkIsolateProfile extends ModChangeNotifier {
  late final SendPort _newIsolateSendPort;
  late final ReceivePort _receivePort;
  late final Isolate _newIsolate;
  late final Future networkIsolateFuture;

  NetworkIsolateProfile() : super() {
    print("AAA");
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    networkIsolateFuture = createNetworkIsolate();
    super.init(isRealInit: isRealInit);
  }

  Future<SendPort> createNetworkIsolate() async {
    var conn = await openConn();
    _receivePort = ReceivePort();
    _newIsolate = await Isolate.spawn(
      runNetworkIsolate,
      _receivePort.sendPort,
    );
    _newIsolateSendPort = await _receivePort.first;
    _newIsolateSendPort.send(CrossIsolatesMessage<String>(
      sender: _receivePort.sendPort,
      message: await IzarManager.instance.getDbPath,
    ));
    _receivePort.listen(IsolateMessageListener.instance.mainListener);
    // await Future.delayed(Duration(seconds: 1000));
    await closeConn();
    return _newIsolateSendPort;
  }

  Future<SendPort> sendToNetworkIsolate<T>(
      T msg, CrossIsolatesMessageType msgType) async {
    _newIsolateSendPort.send(CrossIsolatesMessage<T>(
      sender: _receivePort.sendPort,
      message: msg,
      msgType: msgType,
    ));
    return _newIsolateSendPort;
  }

  Future<CrossIsolatesMessage<TAns>> sendToNetworkIsolateWithAnswer<T, TAns>(
    T msg,
    CrossIsolatesMessageType msgType,
    CrossIsolatesMessageType ansMsgType,
  ) async {
    await sendToNetworkIsolate<T>(msg, msgType);
    CrossIsolatesMessage<TAns> answer = await IsolateMessageListener.instance
        .getMessageStream<TAns>(ansMsgType)
        .first;
    return answer;
  }

  // set user(UserDbDS? user) {
  //   if (this._user != user || _firstUserInit) {
  //     _firstUserInit = false;
  //     this._user = user;
  //     _awaitUser = (() async => this._user)();
  //     if (user != null) {
  //       networkProcessor(this);
  //     }
  //
  //     notifyListeners();
  //   }
  // }

  @override
  List<CollectionSchema<AbstractEntity>> get classes => [];

  @override
  void dispose() {
    super.dispose();
  }
}
