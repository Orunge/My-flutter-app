import 'package:flutter/material.dart';
import 'shalgalt_page.dart';
import 'bodlogo_page.dart';
import 'profile_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top purple bar with greeting
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 15),
            color: const Color(0xFFB968B9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Сайн уу, Ану!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB13B74),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'ЭЛТ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Main content with scrollable area
          Expanded(
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Profile section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle, color: Colors.black),
                                  SizedBox(width: 8),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             
                             
                            // Profile card
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // Profile avatar
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFAEADD),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'avatar.jpg', // Updated path without assets/ prefix
                                            width: 50,
                                            height: 50,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Icon(
                                                Icons.person,
                                                size: 30,
                                                color: Colors.orange[300],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      
                                      // Profile details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Ану Ишдорж',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const Text(
                                              'эксперт',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                ...List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    size: 16,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                const Text(
                                                  '7/10 дундаж оноо',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey.shade300),
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: const Text(
                                                    'ЭКСП',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      size: 8,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'Элит цэргийн',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Last Visit: 25/11/2022',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => const ProfilePage(),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Профайл харах',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 12,
                                                  color: Colors.grey[700],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Two card section
                      Row(
                        children: [
                          // First card - Track Pets
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BodlogoPage(),
                                  ),
                                );
                              },
                              child: _buildFeatureCard(
                                icon: Icons.location_on,
                                title: 'Бодлого',
                                subtitle: 'Бодлого',
                                color: Colors.blue.shade100,
                                illustration: 'boy_illustration.jpg',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Second card - Check Pets
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const GamePage(),
                                  ),
                                );
                              },
                              child: _buildFeatureCard(
                                icon: Icons.chat_bubble_outline,
                                title: 'Шалгалт',
                                subtitle: 'Шалгалт',
                                color: Colors.amber.shade100,
                                illustration: 'story-illustration.jpg',
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Statistics section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.pets),
                                    SizedBox(width: 8),
                                    Text(
                                      'Ану Ишдорж',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const DashboardPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFB968B9).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Дэлгэрэнгүй',
                                          style: TextStyle(
                                            color: const Color(0xFFB968B9),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 16,
                                          color: const Color(0xFFB968B9),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Stats charts
                            SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  // Left arrow
                                  IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: () {},
                                  ),
                                  
                                  // Three charts
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Pie chart
                                        Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CustomPaint(
                                                painter: SimplePieChartPainter(),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Идэвхи',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        // Line chart
                                        Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              child: CustomPaint(
                                                painter: SimpleLineChartPainter(),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Дасгал',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        // Bar chart
                                        Column(
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              child: CustomPaint(
                                                painter: SimpleBarChartPainter(),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Хугацаа',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Right arrow
                                  IconButton(
                                    icon: const Icon(Icons.chevron_right),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Bottom navigation bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home, 'HOME', true),
                  _buildNavItem(Icons.dashboard, 'DASHBOARD', false),
                  _buildNavItem(Icons.explore, 'EXPLORE', false),
                  _buildNavItem(Icons.school, 'LESSON', false),
                  _buildNavItem(Icons.person, 'PROFILE', false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String illustration,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 200,
            transform: Matrix4.identity()
              ..translate(0.0, isHovered ? -2.0 : 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, isHovered ? 2 : 1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      illustration,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: color.withOpacity(0.2),
                        );
                      },
                    ),
                  ),
                  // Overlay gradient
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon and title
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Icon(icon, color: Colors.blue),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        
                        const Spacer(),
                        
                        // Bottom text and arrow
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_forward, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFB968B9) : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFFB968B9) : Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Custom painters for charts

class SimplePieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    
    // Draw pie chart segments
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // Blue segment (60%)
    paint.color = Colors.blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      3.6 * 21.6, // 60% of 360 degrees
      true,
      paint,
    );
    
    // Orange segment (20%)
    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.6 * 21.6,
      3.6 * 7.2, // 20% of 360 degrees
      true,
      paint,
    );
    
    // Green segment (10%)
    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.6 * 28.8,
      3.6 * 3.6, // 10% of 360 degrees
      true,
      paint,
    );
    
    // Navy segment (10%)
    paint.color = Colors.indigo;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.6 * 32.4,
      3.6 * 3.6, // 10% of 360 degrees
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SimpleLineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    // Draw grid
    for (int i = 1; i < 4; i++) {
      final y = i * (size.height / 4);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
    
    // Draw line chart
    final Path path = Path();
    
    // Sample data points (normalized to fit the chart)
    final List<double> dataPoints = [
      0.5, 0.6, 0.4, 0.7, 0.5, 0.8, 0.6
    ];
    
    final double pointWidth = size.width / (dataPoints.length - 1);
    
    path.moveTo(0, size.height * (1 - dataPoints[0]));
    
    for (int i = 1; i < dataPoints.length; i++) {
      final x = i * pointWidth;
      final y = size.height * (1 - dataPoints[i]);
      path.lineTo(x, y);
    }
    
    canvas.drawPath(path, linePaint);
    
    // Draw points
    final Paint pointPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    
    for (int i = 0; i < dataPoints.length; i++) {
      final x = i * pointWidth;
      final y = size.height * (1 - dataPoints[i]);
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SimpleBarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint barPaint = Paint()
      ..color = Colors.blue.shade300
      ..style = PaintingStyle.fill;
    
    // Draw bars
    final List<double> dataValues = [0.2, 0.5, 0.7, 0.9, 0.6, 0.4, 0.3, 0.1];
    
    final double barWidth = size.width / (dataValues.length * 1.5);
    final double spacing = barWidth / 2;
    
    for (int i = 0; i < dataValues.length; i++) {
      final double barHeight = size.height * dataValues[i];
      final double left = i * (barWidth + spacing);
      
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            left,
            size.height - barHeight,
            barWidth,
            barHeight,
          ),
          const Radius.circular(3),
        ),
        barPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}