// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final VoidCallback? inc;
  final VoidCallback? dec;

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);


    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: "decrementar",
              child: ElevatedButton(
                onPressed: dec,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "$valor min",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Tooltip(
              message: "Incrementar",
              child: ElevatedButton(
                onPressed: inc,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
