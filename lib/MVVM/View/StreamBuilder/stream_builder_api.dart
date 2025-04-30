import 'dart:async';

import 'package:flutter/material.dart';

enum Event { increment, decrement }

class CounterController {
  int counter = 0;

// handel changes on contervalue
  final StreamController<int> _counterController =
      StreamController<int>.broadcast(sync: true);
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

// this will handel changes on button side event, this will help to reduse the logic on ui side

  final StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get eventSink => _eventController.sink;
  Stream<Event> get eventStream => _eventController.stream;

// now we create listner here for listing the events

  StreamSubscription? listner;

  CounterController() {
    listner = eventStream.listen((Event event) {
      switch (event) {
        case Event.increment:
          counter += 1;
          break;
        case Event.decrement:
          counter -= 1;
          break;

        default:
      }
      counterSink.add(counter);
    });
  }

  dispose() {
    listner?.cancel();
    _counterController.close();
    _eventController.close();
  }
}

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  late CounterController _counterController;
  Timer? incrementTimer;
  Timer? decrementTimer;

  @override
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override
  void dispose() {
    _counterController.dispose();
    incrementTimer?.cancel();
    decrementTimer?.cancel();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: StreamBuilder(
              stream: _counterController.counterStream,
              initialData: 0,
              builder: (context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    "Empty Data",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onLongPress: () => setState(() {
                  activate();
                  decrementTimer =
                      Timer.periodic(const Duration(milliseconds: 50), (timer) {
                    setState(() {
                      _counterController.eventSink.add(Event.decrement);
                    });
                  });
                }),
                onLongPressEnd: (_) {
                  decrementTimer?.cancel();
                },
                onTap: () => _counterController.eventSink.add(Event.decrement),
                child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.red.withOpacity(0.4),
                        Colors.purpleAccent
                      ]),
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.remove)),
              ),
              GestureDetector(
                onLongPress: () => setState(() {
                  incrementTimer =
                      Timer.periodic(const Duration(milliseconds: 50), (timer) {
                    setState(() {
                      _counterController.eventSink.add(Event.increment);
                    });
                  });
                }),
                onLongPressEnd: (_) {
                  incrementTimer?.cancel();
                },
                onTap: () => _counterController.eventSink.add(Event.increment),
                child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.red.withOpacity(0.4),
                        Colors.purpleAccent
                      ]),
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
