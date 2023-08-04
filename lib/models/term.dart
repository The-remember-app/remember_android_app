
import 'package:uuid/uuid.dart';

import 'folder.dart';
import 'module.dart';

class TermEntity {
  final Uuid id;
  final String term;
  final String definition;
  final Uuid module_id;
  int choose_error_counter;
  int write_error_counter;
  int choise_neg_error_counter;

  TermEntity(this.id, this.term, this.definition, this.module_id,
      this.choose_error_counter, this.write_error_counter,
      this.choise_neg_error_counter);

  TermEntity.test(String term, String definition, Uuid module_id)
      : this(Uuid(), term, definition, module_id, 0, 0, 0);

  static Map<Uuid, TermEntity> getTestTerms() {
    final Map<String, String> wordsSet = {
      "one": 'Один',
      "two": "два",
      "three": 'три',
      "four": "Четыре",
      "five": "Пять",
      "six": "шесть",
      "seven": "семь",
    };

    final Map<Uuid, TermEntity> words = {
      for (var t in [
        for (var v in wordsSet.entries)
          for (var m in foldersOrModules.entries)
            if (m.value is Module) TermEntity.test(v.key, v.value, m.key)
      ])
        t.id: t
    };
    return words;
  }
}

final Map<Uuid, TermEntity> words = TermEntity.getTestTerms();
