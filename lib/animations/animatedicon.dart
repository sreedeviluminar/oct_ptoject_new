import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Anim_Icon(),));
}
class Anim_Icon extends StatefulWidget {
  const Anim_Icon({super.key});

  @override
  State<Anim_Icon> createState() => _Anim_IconState();
}

class _Anim_IconState extends State<Anim_Icon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => startAnimation(),
          child: AnimatedIcon(
            icon: AnimatedIcons.pause_play,
            progress: animation,
            size: 70,
          ),
        ),
      ),
    );
  }

  void startAnimation() {
    if (animationController.isDismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}
