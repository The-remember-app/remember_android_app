

import '../../../main.dart';
import '../../folder_repository/local_db_data_source/folder.dart';

class Module extends AbstractFolder {

  bool is_reverce_defitition_write = false;
  bool standart_and_reverce_write = true;
  bool is_reverce_defitition_choice = false;
  bool standart_and_reverce_choice = true;

  Module.genId(super.name) : super.genId();

  Module(super.id, super.name);

}