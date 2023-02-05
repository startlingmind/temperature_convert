import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(color: Color.fromARGB(50, 255, 255, 255)),
          child: Padding(
            padding: Width > 500 && Height > 500
                ? const EdgeInsets.only(top: 80, bottom: 80)
                : const EdgeInsets.all(0),
            child: Container(
                width: Width > 500 ? Width / 2 : Width,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Color.fromARGB(31, 98, 93, 93),
                  ),
                ]),
                child: const Conversion()),
          )),
    );
  }
}

class Conversion extends StatelessWidget {
  const Conversion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Celcius to Fahrenheit Converter",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontFamily: 'Arial',
              color: Color.fromARGB(82, 41, 34, 34),
              overflow: TextOverflow.clip),
        ),
        SizedBox(
          height: 40,
        ),
        TextFields(),
      ],
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields({super.key});

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: Width,
      child: Width > 750
          ? RowLayout(Width: Width, Height: Height)
          : ColumnLayout(Width: Width, Height: Height),
    );
  }
}

class RowLayout extends StatelessWidget {
  const RowLayout({
    super.key,
    required this.Width,
    required this.Height,
  });

  final double Width;
  final double Height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: Width > 750 ? Height / 4 : Height / 6,
          width: Width > 750 ? Height / 4 : Width / 6,
          child: const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Celcius"),
          ),
        ),
        SizedBox(
          height: Width > 750 ? Height / 4 : Height / 6,
          width: Width > 750 ? Height / 4 : Width / 6,
          child: const TextField(
            readOnly: true,
            decoration: InputDecoration(
              //labelText: "celcius",
              hintText: "Fahrenheit",
            ),
          ),
        )
      ],
    );
  }
}

class ColumnLayout extends StatelessWidget {
  const ColumnLayout({
    super.key,
    required this.Width,
    required this.Height,
  });

  final double Width;
  final double Height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: Width > 500 ? Height / 4 : Height / 8,
          width: Width > 500 ? Height / 4 : Width / 8,
          child: const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Celcius"),
          ),
        ),
        SizedBox(
          height: Width > 500 ? Height / 4 : Height / 8,
          width: Width > 500 ? Height / 4 : Width / 8,
          child: const TextField(
            readOnly: true,
            decoration: InputDecoration(
              //labelText: "celcius",
              hintText: "Fahrenheit",
            ),
          ),
        )
      ],
    );
  }
}
