import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:model_viewer/model_viewer.dart';

List<String> ar = ['https://storage.echoar.xyz/raspy-thunder-0385/7b3873e4-e35a-4ea8-a599-c706c25a922f.glb','https://storage.echoar.xyz/raspy-thunder-0385/a8d99d60-3f84-40d0-8003-ac2997fe0647.glb'];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Book Case'),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Models(
                            src: ar[0],
                          )
                          ));
                },
              ),
              SizedBox(
                height: height/15,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Models(
                              src: ar[1],
                            )
                        ));
                  },
                  child: Text('Coffee Table'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Models extends StatefulWidget {
  final String src;
  const Models({required this.src});
  @override
  _ModelsState createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AR Model'))),
      body: ModelViewer(
        backgroundColor: Colors.white,
        src: widget.src,
        alt: "3D Models",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}

