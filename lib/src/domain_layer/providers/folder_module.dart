

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/domain_layer/providers/user_api_provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';


class FolderAndModuleProvider with ChangeNotifier {
  FolderDbDS? _currentFolder = null;
  List<FolderDbDS?> _rootFolder = [];


  ModuleDbDS? _currentModule = null;
  bool _firstFolderInit = true;
  final UserApiProfile userPr;


  FolderAndModuleProvider({required this.userPr});

  FolderDbDS? get rootFolder => _rootFolder.last;

  AbstractEntity? get activeEntity => _currentModule ?? _currentFolder;

  set activeEntity(AbstractEntity? value) {
    if (value is FolderDbDS){
      var newFolder = value as FolderDbDS;
      if (value == _currentFolder && _currentModule == null){

      } else {
        _rootFolderSet(newFolder);
        _currentFolder = newFolder;
        _currentModule = null;
        notifyListeners();
      }

    } else if (value is ModuleDbDS){
      if (value == _currentModule){

      } else {
        _currentModule = value;
        notifyListeners();
      }

    } else if (value == null){
      if (_currentFolder == null && _currentModule == null){

      } else {
        _rootFolderSet(null);
        _currentFolder = null;
        _currentModule = null;
        notifyListeners();
      }

    } else {
      throw UnimplementedError();
    }
  }

  ModuleDbDS? get currentModule => _currentModule;

  set currentModule(ModuleDbDS? value) {
    if (_currentModule != value || _firstFolderInit) {
      _firstFolderInit = false;
      _currentModule = value;
      notifyListeners();
    }
  }

  FolderDbDS? get currentFolder => _currentFolder;

  set currentFolder(FolderDbDS? folder) {
    if (this._currentFolder != folder || _firstFolderInit) {
      _firstFolderInit = false;
      _rootFolderSet(folder);
      this._currentFolder = folder;
      this._currentModule = null;
      notifyListeners();
    }
  }

  void _rootFolderSet(FolderDbDS? newFolder) {
    if (newFolder == _currentFolder && _currentModule == null) {

    } else {
      if (newFolder == null){
        if (_currentFolder != null){
          _rootFolder.removeAt(_rootFolder.length - 1);
        }

      } else if (newFolder != _currentFolder) {
        if (_currentFolder == null) {
          _rootFolder.add(null);
        } else if (newFolder.rootFolderUuid == _currentFolder!.uuid) {
          _rootFolder.add(_currentFolder);
        } else if (_currentFolder!.rootFolderUuid == newFolder.uuid) {
          _rootFolder.removeAt(_rootFolder.length - 1);
        } else {
          throw UnimplementedError();
        }
      }
    }
  }



}