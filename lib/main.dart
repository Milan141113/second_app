import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white70,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.yellow,
        //     : Colors.black,
        //   ),
        // ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.yellow.shade100,
          border: OutlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/auth': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Nike Shoes',
      price: 99.99,
      imageUrl: 'assets/first.jpg',
    ),

    Product(
      name: 'Nike Shoes',
      price: 99.99,
      imageUrl: 'assets/first.jpg',
    ),
    Product(
      name: 'Nike Shoes',
      price: 99.99,
      imageUrl: 'assets/first.jpg',
    ),
    Product(
      name: 'Nike Shoes',
      price: 99.99,
      imageUrl: 'assets/first.jpg',
    ),
    Product(
      name: 'Nike Shoes',
      price: 99.99,
      imageUrl: 'assets/first.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/auth');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              product.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox( height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AuthPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login', style: TextStyle(fontSize: 30),),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(
                  color: Colors.yellow,
                )
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white70,
                labelStyle: TextStyle(
                  color: Colors.yellow,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logged in as $email')),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid credentials')),
                  );
                }
              },
              child: Text('Login', style: TextStyle(fontSize: 25, ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registered as $email')),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid credentials')),
                  );
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
