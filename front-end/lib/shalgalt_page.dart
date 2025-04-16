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
      final res = await http.get(Uri.parse('http://127.0.0.1:5001/api/game/list'));
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
        Uri.parse('http://127.0.0.1:5001/api/game/progress'),
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
    final String type = game['type'] ?? '';
    final String question = game['question'] ?? '';
    final List options = game['options'] ?? [];
    final String correct = game['correct'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text('Тоглоом — 🧠 Оноо: $score')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),

              /// 🔸 Асуулт хэсэг
             type == 'color-sequence'
  ? Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      children: question
          .replaceAll('❓', '')
          .trim()
          .split(' ')
          .map((e) => Text(
                e,
                style: const TextStyle(fontSize: 36),
              ))
          .toList(),
    )
  : Text(
      question,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),

              const SizedBox(height: 30),

              /// 🔘 Сонголт товчлуурууд
 GridView.count(
  shrinkWrap: true,
  crossAxisCount: 2,
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  physics: const NeverScrollableScrollPhysics(),
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
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bg ?? Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: answered
          ? null
          : () {
              final isCorrect = opt == correct;

              setState(() {
                answered = true;
                selected = opt;
                if (isCorrect) score += 1;
              });

              saveProgress(game['_id'], opt, isCorrect);

              // ✅ Зөв / буруу ялгаагүй — 1.5 сек хүлээгээд дараагийн асуулт руу шилжих
              Future.delayed(const Duration(milliseconds: 700), () {
                if (currentIndex < games.length - 1) {
                  setState(() {
                    currentIndex += 1;
                    answered = false;
                    selected = '';
                  });
                } else {
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
              });
            },
      child: type == 'shape'
          ? getShapeIcon(opt)
          : Text(opt.toString(), style: const TextStyle(fontSize: 24)),
    );
  }).toList(),
)
            ],
          ),
        ),
      ),
    );
  }
}
