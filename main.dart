import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/stock_service.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const FlashMartApp());
}

class FlashMartApp extends StatelessWidget {
  const FlashMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StockService>(
          create: (_) => StockService(),
          dispose: (_, service) => service.dispose(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(context.read<StockService>()),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flash Mart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}
