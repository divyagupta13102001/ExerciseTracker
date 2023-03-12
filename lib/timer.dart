import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  int _secondsRemaining = 10;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_secondsRemaining',
              style: TextStyle(fontSize: 64),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Start'),
              onPressed: () {
                _timer?.cancel();
                _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    if (_secondsRemaining > 0) {
                      _secondsRemaining--;
                    } else {
                      timer.cancel();
                    }
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:flutter/material.dart';

// class MyCountdownTimer extends StatefulWidget {
//   @override
//   _MyCountdownTimerState createState() => _MyCountdownTimerState();
// }

// class _MyCountdownTimerState extends State<MyCountdownTimer> {
//   CountdownTimer? countdownTimer;

//   @override
//   void initState() {
//     super.initState();
//     countdownTimer = CountdownTimer(
//       endTime: DateTime.now().millisecondsSinceEpoch + 60000,
//       onEnd: () {
//         print('Countdown ended');
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '${countdownTimer.days ?? ''} ${countdownTimer!.hours ?? ''}:${countdownTimer?.minutes ?? ''}:${countdownTimer.seconds ?? ''}',
//       style: TextStyle(fontSize: 24),
//     );
//   }
// }
