import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List games = [];
  int currentIndex = 0;
  int score = 0;
  bool answered = false;
  String selected = '';

  @override
  void initState() {
    super.initState();
    loadGames();
  }

  Future<void> loadGames() async {
    try {
      final res = await http.get(Uri.parse('http://172.16.151.162:5001/api/game/list'));
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() => games = data);
      }
    } catch (e) {
      debugPrint("❌ Асуулт ачаалахад алдаа: $e");
    }
  }

  Future<void> saveProgress(String gameId, String answer, bool isCorrect) async {
    try {
      await http.post(
        Uri.parse('http://172.16.151.162:5001/api/game/progress'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'gameId': gameId,
          'selectedAnswer': answer,
          'isCorrect': isCorrect,
        }),
      );
    } catch (e) {
      debugPrint("❌ Хариу илгээх алдаа: $e");
    }
  }

  Widget getShapeIcon(String shape) {
    switch (shape) {
      case 'circle':
        return const Icon(Icons.circle, size: 50);
      case 'square':
        return const Icon(Icons.square, size: 50);
      case 'triangle':
        return Transform.rotate(
          angle: pi / 4,
          child: const Icon(Icons.change_history, size: 50),
        );
      default:
        return const Icon(Icons.help_outline);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final game = games[currentIndex];
    final type = game['type'];
    final question = game['question'];
    final options = game['options'];
    final correct = game['correct'];

    return Scaffold(
      appBar: AppBar(title: Text('Тоглоом — 🧠 Оноо: $score')),
      body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
            const SizedBox(height: 30),
            // 🔸 Асуулт хэсэг
            type == 'color-sequence'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: question
                        .replaceAll('❓', '')
                        .trim()
                        .split(' ')
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(e, style: const TextStyle(fontSize: 36)),
                            ))
                        .toList(),
                  )
                : Text(
                    question,
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 30),
            // 🔘 Сонголт товчлуурууд
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: options.map<Widget>((opt) {
                final isCorrect = opt == correct;
                final isSelected = opt == selected;

                Color? bg;
                if (answered) {
                  bg = isSelected
                      ? (isCorrect ? Colors.green : Colors.red)
                      : Colors.grey[300];
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bg ?? Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: answered
                      ? null
                      : () {
                          setState(() {
                            answered = true;
                            selected = opt;
                            if (isCorrect) score += 1;
                          });
                          saveProgress(game['_id'], opt, isCorrect);
                        },
                  child: type == 'shape'
                      ? getShapeIcon(opt)
                      : Text(opt.toString(), style: const TextStyle(fontSize: 24)),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // 🔄 Дараагийн асуулт руу шилжих
            if (answered)
              ElevatedButton(
                onPressed: () {
                  if (currentIndex < games.length - 1) {
                    setState(() {
                      currentIndex += 1;
                      answered = false;
                      selected = '';
                    });
                  } else {
                    // 🎉 Дууссан үед
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("🎉 Амжилттай"),
                        content: Text("Та $score оноо авлаа!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                currentIndex = 0;
                                score = 0;
                                answered = false;
                                selected = '';
                              });
                            },
                            child: const Text("Дахин тоглох"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: Text(currentIndex < games.length - 1 ? '➡️ Дараах' : '🎉 Дуусгах'),
              ),
          ],
        ),
      ),
    )
    );
  }
}
