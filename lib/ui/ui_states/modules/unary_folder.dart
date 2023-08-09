// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
//
// AppBar AppBarBuilder(String appBarText, BuildContext context,
//     {List<(IconButton Function()?, Function?)>? leading = null,
//     List<Map<String, List<Function?>>>? actions = null}) {
//   var currLeading = null;
//   if (leading != null) {
//     for (var (leadingWidget, leadingAction) in leading) {
//       if (leadingAction == null) {
//         // доавить действие по умолчанию (стрелку назад)
//       }
//     }
//   }
//   return AppBar(
//     elevation: 4,
//     centerTitle: false,
//     automaticallyImplyLeading: false,
//     backgroundColor: Color(0xff3a57e8),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.zero,
//     ),
//     title: Text(
//       appBarText,
//       style: TextStyle(
//         fontWeight: FontWeight.w700,
//         fontStyle: FontStyle.normal,
//         fontSize: 20,
//         color: Color(0xfff9f9f9),
//       ),
//     ),
//     leading: IconButton(
//       icon: Icon(
//         Icons.arrow_back,
//         color: Color(0xfff9f9f9),
//         size: 24,
//       ),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//     actions: [
//       Icon(Icons.search, color: Color(0xffffffff), size: 24),
//     ],
//   );
// }
//
// AppBar AppBarWithSearch(String appBarText, BuildContext context) {
//   return AppBar(
//     elevation: 4,
//     centerTitle: false,
//     automaticallyImplyLeading: false,
//     backgroundColor: Color(0xff3a57e8),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.zero,
//     ),
//     title: Text(
//       appBarText,
//       style: TextStyle(
//         fontWeight: FontWeight.w700,
//         fontStyle: FontStyle.normal,
//         fontSize: 20,
//         color: Color(0xfff9f9f9),
//       ),
//     ),
//     actions: [
//       Icon(Icons.search, color: Color(0xffffffff), size: 24),
//     ],
//   );
// }
//
// AppBar AppBarWithArrowBack() {
//   return AppBar(
//     elevation: 4,
//     centerTitle: false,
//     automaticallyImplyLeading: false,
//     backgroundColor: Color(0xff3a57e8),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.zero,
//     ),
//     title: Text(
//       folder?.name ?? "Не найдено ничего по этому UUID",
//       style: TextStyle(
//         fontWeight: FontWeight.w700,
//         fontStyle: FontStyle.normal,
//         fontSize: 20,
//         color: Color(0xfff9f9f9),
//       ),
//     ),
//     actions: [
//       Icon(Icons.search, color: Color(0xffffffff), size: 24),
//     ],
//   );
// }
//
// IconButton getStandardArrowBackButton(
//     Map<String, Function?> buttonTriggers, BuildContext context) {
//   var buttonTriggersLoc = {
//     for (var kv in buttonTriggers.entries) kv.key: kv.value
//   };
//   buttonTriggersLoc['onPressed'] = buttonTriggersLoc['onPressed'] ??
//       () {
//         Navigator.pop(context);
//       };
//   return IconButton(
//     icon: Icon(
//       Icons.arrow_back,
//       color: Color(0xfff9f9f9),
//       size: 24,
//     ),
//     onPressed: buttonTriggersLoc['onPressed'] as void Function()?,
//   );
// }
