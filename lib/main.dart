import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Proportional Containers'),
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: ContainerWithProportionalWidth()
            ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: ContainerWithProportionalWidth2(),

            )
          ],
        ),



      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerWithProportionalWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double parentContainerWidth = screenWidth * 0.7; // Proportional width of the parent container
        double parentContainerHeight = constraints.maxHeight * 0.5;
        return Container(
          color: Colors.red[300], // Color of the outer container
          padding: EdgeInsets.all(16.0), // Add padding for spacing
          height: 150,
          width: parentContainerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
            children: [
              ProportionalContainer(
                color: Colors.grey, // Color of the first inner container
                proportion: 0.3, // Adjust the proportion as needed
                height: 30, // Height of the first container
              ),
              SizedBox(height: 20),
              ProportionalContainer(
                color: Colors.green, // Color of the second inner container
                proportion: 0.5, // Adjust the proportion as needed
                height: 30, // Height of the second container
              ),
            ],
          ),
        );
      },
    );
  }
}


class ContainerWithProportionalWidth2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double parentContainerWidth = screenWidth * 0.7; // Proportional width of the parent container
        double parentContainerHeight = constraints.maxHeight*0.5;
        return Container(
          color: Colors.red[300], // Color of the outer container
          padding: EdgeInsets.all(16.0), // Add padding for spacing
          height: 150,
          width: parentContainerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
            children: [
              Container(
                color: Colors.grey, // Color of the first inner container
                height: 30, // Height of the first container
                width: 100,
              ),
              SizedBox(height: 20),
              ProportionalContainer(
                color: Colors.green, // Color of the second inner container
                proportion: 0.5, // Adjust the proportion as needed
                height: 30, // Height of the second container
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProportionalContainer extends StatelessWidget {
  final Color color;
  final double proportion;
  final double height;

  ProportionalContainer({required this.color, required this.proportion, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * proportion;
        double containerHeight = constraints.maxHeight * proportion;
        return Container(
          color: color,
          width: containerWidth,
          height: height,
        );
      },
    );
  }
}
