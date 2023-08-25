import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ModuleWithTerms extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserApiProfile()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: AwaitUserScreen(awaitUserFunc),
    );
  }
}