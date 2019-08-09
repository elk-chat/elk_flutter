// Reference: https://github.com/axetroy/event-emitter.dart

typedef void RemoveListener();

abstract class EventEmitterInterface {
  Map<String, List<Function>> events;

  RemoveListener on(String event, Function handler([dynamic data]));

  void once(String event, Function handler([dynamic data]));

  void off(String event);

  void clear();

  void emit(String event, [dynamic data]);
}

class EventEmitter extends EventEmitterInterface {
  // storage for the event handler
  Map<String, List<Function>> _events = Map();

  // proxy the private property, make it readonly. cannot modify from outside
  Map<String, List<Function>> get events => _events;

  EventEmitter();

  // listen the event
  // it will return a function to cancel this listening
  on(String event, void handler(dynamic data)) {
    final List eventContainer =
        _events.putIfAbsent(event, () => List<Function>());
    eventContainer.add(handler);
    void offThisListener() {
      eventContainer.remove(handler);
    }

    return offThisListener;
  }

  // listen the event once
  // it will remove listening once it trigger
  void once(String event, void handler(dynamic data)) {
    final List eventContainer =
        _events.putIfAbsent(event, () => List<Function>());
    eventContainer.add((dynamic data) {
      handler(data);
      off(event);
    });
  }

  // remove a event listening
  void off(String event) {
    _events.remove(event);
  }

  // emit a event with a optional data
  void emit(String event, [dynamic data]) {
    final List eventContainer = _events[event] ?? [];
    for (dynamic handler in eventContainer) {
      if (handler is Function) handler(data);
    }
  }

  // clear the all listening
  void clear() {
    _events.clear();
  }
}
