// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.DESCANSO;

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void reiniciar() {}

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  @action
  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  @action
  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }
}