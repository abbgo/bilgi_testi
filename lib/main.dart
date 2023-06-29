import 'package:bilgi_testi/constraints.dart';
import 'package:bilgi_testi/sorag.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BilgiTesti());
}

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SoragSahypasy(),
          ),
        ),
      ),
    );
  }
}

class SoragSahypasy extends StatefulWidget {
  const SoragSahypasy({Key? key}) : super(key: key);

  @override
  State<SoragSahypasy> createState() => _SoragSahypasyState();
}

class _SoragSahypasyState extends State<SoragSahypasy> {
  List<Widget> moods = [];
  SoragMaglumatlary soragMaglumatlary = SoragMaglumatlary();

  void buttonFunction(bool soragynJogaby) {
    int dogryJogaplanSany = soragMaglumatlary.dogrylaryAl();
    if (soragMaglumatlary.soraglarGutardymy() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Gutlysss test gutardy"),
              content: Text(
                  "Siz $dogryJogaplanSany sany soraga dogry jogap berdiniz"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      soragMaglumatlary.setCounterNull();
                      moods = [];
                    });
                  },
                  child: const Text("Tazeden basla"),
                ),
              ],
            );
          });
    } else {
      setState(() {
        if (soragMaglumatlary.getSoragJogap() == soragynJogaby) {
          moods.add(dogry);
          soragMaglumatlary.dogrylarySana();
        } else {
          moods.add(yalnys);
        }
        soragMaglumatlary.counterArtdyr();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soragMaglumatlary.getSoragSoz(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: moods,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          buttonFunction(false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Icon(
                          Icons.thumb_down,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          buttonFunction(true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[400],
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Icon(
                          Icons.thumb_up,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
