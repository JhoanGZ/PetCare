import 'package:flutter/material.dart';

// class LogInPage extends StatelessWidget {
//   const LogInPage({super.key});
//   @override
//   State<LogInPage> createState() => _LogInPageState();
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _LogInPageState extends State<LogInPage>{
//   @override
//   Widget build(BuildContext context){
//     return const Scaffold(
//       body: Center (
//         child: Column([
//           Container(
//             child: Text
//           )
//         ]
//           ),
//         ),
//     );
//   }
// }
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi aplicación'),
      ),
      body: const Center(
        child: Text(
          'Supuesto Login',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}