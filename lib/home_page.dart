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
          decoration: const BoxDecoration(color: Colors.white30),
          child: Padding(
            padding: Width > 500 && Height > 500
                ? const EdgeInsets.only(top: 80, bottom: 80)
                : const EdgeInsets.all(0),
            child: Container(
                width: Width > 500 ? Width / 2 : Width,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 10,
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
              color: Color.fromARGB(234, 50, 47, 47),
              overflow: TextOverflow.clip),
        ),
        SizedBox(
          height: 40,
        ),
        TextFields(),
        SizedBox(height: 40),
        // TextButton(onPressed: reset(), child: Text("Reset")),
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

class RowLayout extends StatefulWidget {
  const RowLayout({
    super.key,
    required this.Width,
    required this.Height,
  });

  final double Width;
  final double Height;

  @override
  State<RowLayout> createState() => _RowLayoutState();
}

class _RowLayoutState extends State<RowLayout> {
  final celciusController = TextEditingController();
  final fahrenheitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    celciusController.addListener(_updateTarget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height:
                  widget.Width > 750 ? widget.Height / 4 : widget.Height / 6,
              width: widget.Width > 750 ? widget.Height / 4 : widget.Width / 6,
              child: TextField(
                controller: celciusController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Celcius"),
              ),
            ),
            SizedBox(
              height:
                  widget.Width > 750 ? widget.Height / 4 : widget.Height / 6,
              width: widget.Width > 750 ? widget.Height / 4 : widget.Width / 6,
              child: TextField(
                controller: fahrenheitController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "fahrenheit",
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: reset,
          child: const Text("Reset"),
        )
      ],
    );
  }

  void _updateTarget() {
    String celcius = celciusController.text;
    double fahrenheit = double.parse(celcius);
    fahrenheit = (9 * fahrenheit) / 5 + 32;
    fahrenheitController.text = fahrenheit.toString();
  }

  // @override
  void reset() {
    celciusController.clear();
    fahrenheitController.clear();
  }

  @override
  void dispose() {
    celciusController.removeListener(_updateTarget);
    celciusController.dispose();
    fahrenheitController.dispose();
    super.dispose();
  }
}

class ColumnLayout extends StatefulWidget {
  const ColumnLayout({
    super.key,
    required this.Width,
    required this.Height,
  });

  final double Width;
  final double Height;

  @override
  State<ColumnLayout> createState() => _ColumnLayoutState();
}

class _ColumnLayoutState extends State<ColumnLayout> {
  final celciusController = TextEditingController();
  final fahrenheitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    celciusController.addListener(_updateTarget);
  }

  void _updateTarget() {
    String celcius = celciusController.text;
    double fahrenheit = double.parse(celcius);
    fahrenheit = (9 * fahrenheit) / 5 + 32;
    fahrenheitController.text = fahrenheit.toString();
  }

  // @override
  void reset() {
    celciusController.clear();
    fahrenheitController.clear();
  }

  @override
  void dispose() {
    celciusController.removeListener(_updateTarget);
    celciusController.dispose();
    fahrenheitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  widget.Width > 500 ? widget.Height / 4 : widget.Height / 8,
              width: widget.Width > 500 ? widget.Height / 4 : widget.Width / 8,
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Celcius"),
              ),
            ),
            SizedBox(
              height:
                  widget.Width > 500 ? widget.Height / 4 : widget.Height / 8,
              width: widget.Width > 500 ? widget.Height / 4 : widget.Width / 8,
              child: const TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Fahrenheit",
                ),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: reset,
          child: const Text("Reset"),
        )
        //TextButton(onPressed: reset(), child: Text("Reset"))
      ],
    );
  }
}
