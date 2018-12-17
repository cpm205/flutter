import 'dart:async';

void main() {
  //
  // Initialize a "Broadcast" Stream controller of integers
  //
  final StreamController<int> ctrl = StreamController<int>.broadcast();

  //
  // Initialize a single listener which filters out the odd numbers and
  // only prints the even numbers
  //
  final StreamSubscription subscription = ctrl.stream
      .where((value) => (value % 2 == 0))
      .listen((value) => print('$value'));

  //
  // We here add the data that will flow inside the stream
  //
  for(int i=1; i<11; i++){
    ctrl.sink.add(i);
  }

  //
  // We release the StreamController
  //
  /*This statement applies to:

  StreamSubscription - when you no longer need to listen to a stream, cancel the subscription;
  StreamController - when you no longer need a StreamController, close it;
  the same applies to RxDart Subjects, when you no longer need a BehaviourSubject, a PublishSubject…, close it.*/
  ctrl.close();
}