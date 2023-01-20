import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  List<String> Sebha = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لا اله الا الله",
    "لا حول ولا قوه الا بالله",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              onTap: OnSebha,
              child: Image.asset(
                "assets/images/sebha_main_pg.png",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text("عدد التسبيحات", style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 10,
                    color: Color.fromRGBO(183, 147, 95, 1.0),
                  )),
              child: Text(
                "$counter",
                style: const TextStyle(
                    fontSize: 25,
                    backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromRGBO(183, 147, 95, 1.0)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "${Sebha[index]}",
                          style: const TextStyle(fontSize: 25, color: Colors.white),
                        )),),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void OnSebha() {
    counter++;
    if (counter ==34 ) {
      index++;
      counter=0;
    }
    if (index == Sebha.length) {
      index = 0;
    }
    setState(() {});
  }

}
