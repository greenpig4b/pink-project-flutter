import 'package:flutter/material.dart';
import '../main/main_page.dart';

class StartviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: 'login/e-mail',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 20),
              Text('Log in with social account'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.network('https://image.pngtree.com/logo/1.png'),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.network('https://image.pngtree.com/logo/2.png'),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.network('https://image.pngtree.com/logo/3.png'),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.green
                ),
                child: Text('Log In'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text('Forgot your password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Log In',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               SizedBox(height: 40),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'login/e-mail',
//                   filled: true,
//                   fillColor: Colors.white70,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'password',
//                   filled: true,
//                   fillColor: Colors.white70,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: false,
//                     onChanged: (value) {},
//                   ),
//                   Text('Remember me'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text('Log in with social account'),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Image.network('https://image.pngtree.com/logo/1.png'),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Image.network('https://image.pngtree.com/logo/2.png'),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Image.network('https://image.pngtree.com/logo/3.png'),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   backgroundColor: Colors.green
//                 ),
//                 child: Text('Log In'),
//               ),
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {},
//                 child: Text('Forgot your password?'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }