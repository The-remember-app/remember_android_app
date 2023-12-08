import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';
import 'package:the_remember/src/ui/ui_states/await_user_screen.dart';

import '../../domain_layer/providers/isolates/network.dart';
import '../../domain_layer/providers/user_api_provider.dart';

Widget NavigationProcessor() {
  Future<UserDbDS?> awaitUserFunc(
      AwaitUserScreen widgetObj, BuildContext context) async {
    var awaitUserWidget = widgetObj;

    if (awaitUserWidget.userGetter == null) {
      var pr = Provider.of<UserApiProfile>(context, listen: false);

      awaitUserWidget.userGetter = pr.awaitUser().then((value) {
        awaitUserWidget.userGetterCompleted = true;
        return value;
      });
    } else if (awaitUserWidget.userGetterCompleted) {
      var userPr = Provider.of<UserApiProfile>(context, listen: false);

      Future<UserDbDS?> getCurrUser(AwaitUserScreen, BuildContext) async {
        return userPr.user;
      }

      awaitUserWidget.userGetter = getCurrUser(widgetObj, context);
    }

    return awaitUserWidget.userGetter!;
  }

  return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>
            NetworkIsolateProfile()
        ),
      ],
      child: UserApiProfileAddWidget( awaitUserFunc: awaitUserFunc,));
}

class UserApiProfileAddWidget extends StatelessWidget{
  final Future<UserDbDS?> Function(AwaitUserScreen, BuildContext) awaitUserFunc;

  const UserApiProfileAddWidget({super.key, required this.awaitUserFunc});


  @override
  Widget build(BuildContext context) {
    var networkPr =  Provider.of<NetworkIsolateProfile>(context, listen: false);
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserApiProfile(
            networkPr: networkPr
        )),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: AwaitUserScreen(awaitUserFunc),
    );
  }

}
