import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(super.initialState);
  sepeteekle(
      {required String photo,
      required int id,
      required String ad,
      required int sayi,
      required double fiyat}) {
    var suankisepet = state.sepet;
    if (suankisepet.any((element) => element["id"] == id)) {
      suankisepet.firstWhere((element) => element["id"] == id)["count"]++;
    } else {}
    suankisepet.add({
      "id": id,
      "photo": photo,
      "name": ad,
      "number": sayi,
      "price": fiyat,
    });
    final newstate = CardState(
      sepet: state.sepet,
    );
    emit(newstate);
  }

  sepettenCikar({
    required int id,
  }) {
    var suankisepet = state.sepet;
    suankisepet.removeWhere((element) => element["id"] == id);

    final newstate = CardState(
      sepet: state.sepet,
    );
    emit(newstate);
  }

  removeshoping(
      {required String name, required int number, required double price}) {
    final newstate = CardState(
      sepet: [],
    );
    emit(newstate);
  }
}
