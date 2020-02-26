//Using Simple animation library (https://pub.dev/packages/simple_animations)
//Inspired from https://medium.com/@felixblaschke/particle-animations-with-flutter-756a23dba027

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class LensParticles extends StatefulWidget {

  final int numberOfParticles;

  LensParticles(this.numberOfParticles);

  @override
  _LensParticlesState createState() => _LensParticlesState();
}

class _LensParticlesState extends State<LensParticles> {

  final Random random = Random();

  final List<LensParticleModel> particles = [];

  @override
  void initState() {
    super.initState();
      List.generate(widget.numberOfParticles, (index) {
      particles.add(LensParticleModel(random));
    });

  }

  @override
  Widget build(BuildContext context) {
      return Rendering(
      startTime: Duration(seconds: 10),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: LensParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}

//To create the particles
class LensParticlePainter extends CustomPainter {
  List<LensParticleModel> particles;
  Duration time;

  LensParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    particles.forEach((particle) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


//Animations for the particles
class LensParticleModel {
  
  Animatable tween;
  double size;
  AnimationProgress animationProgress;
  Random random;

  LensParticleModel(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), random.nextDouble());
    //final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);

    final endPosition = startPosition;

    final duration = Duration(milliseconds: 1000 + random.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.03;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}