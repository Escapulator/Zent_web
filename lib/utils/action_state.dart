import 'dart:async';

class ActionState<T> {
  // the time element makes re-emitting the same state possible
  final T item;
  final int id;

  const ActionState(this.item, this.id);

  factory ActionState.of(T t) {
    return ActionState(t, now());
  }
}

int now() {
  return DateTime.now().millisecondsSinceEpoch;
}

typedef ActionStateController<T> = StreamController<ActionState<T>>;
