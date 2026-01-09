import 'dart:async';
import 'dart:math';

class StockService {
  final _controller = StreamController<Map<String, int>>.broadcast();
  Timer? _timer;
  final Random _random = Random();

  Stream<Map<String, int>> get stockStream => _controller.stream;

  // Simulate starting live updates
  void startSimulation(List<String> productIds) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (productIds.isEmpty) return;

      // Select a random product to "purchase"
      final randomId = productIds[_random.nextInt(productIds.length)];

      // Emit the change
      if (!_controller.isClosed) {
        _controller.add({randomId: -1});
      }
    });
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
