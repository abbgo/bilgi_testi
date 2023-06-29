class Sorag {
  String sorag = "";
  bool jogap = false;

  Sorag({required this.sorag, required this.jogap});
}

class SoragMaglumatlary {
  int _counter = 0;
  int _countOfTrue = 0;

  final List<Sorag> _soraglar = [
    Sorag(sorag: "1.Titanic gelmiş geçmiş en büyük gemidir", jogap: false),
    Sorag(
        sorag: "2.Dünyadaki tavuk sayısı insan sayısından fazladır",
        jogap: true),
    Sorag(sorag: "3.Kelebeklerin ömrü bir gündür", jogap: false),
    Sorag(sorag: "4.Dünya düzdür", jogap: false),
    Sorag(sorag: "5.Kaju fıstığı aslında bir meyvenin sapıdır", jogap: true),
    Sorag(sorag: "6.Fatih Sultan Mehmet hiç patates yememiştir", jogap: true),
    Sorag(sorag: "7.Fransızlar 80 demek için, 4 - 20 der", jogap: true),
  ];

  String getSoragSoz() {
    return _soraglar[_counter].sorag;
  }

  bool getSoragJogap() {
    return _soraglar[_counter].jogap;
  }

  void counterArtdyr() {
    _counter++;
  }

  bool soraglarGutardymy() {
    if (_counter + 1 >= _soraglar.length) {
      return true;
    } else {
      return false;
    }
  }

  void setCounterNull() {
    _counter = 0;
  }

  void dogrylarySana() {
    _countOfTrue++;
  }

  int dogrylaryAl() {
    return _countOfTrue;
  }
}
