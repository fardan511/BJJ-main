// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTable extends StatefulWidget {
  final List<TextEditingController> names, descriptions;
  final List<String> deliveryTimes;
  final List<int> revisions, prices;
  final List<bool> oneVideoReviews, threeVideoReviews, fiveVideoReviews;
  const MyTable({
    super.key,
    required this.names,
    required this.descriptions,
    required this.deliveryTimes,
    required this.revisions,
    required this.oneVideoReviews,
    required this.threeVideoReviews,
    required this.fiveVideoReviews,
    required this.prices,
  });

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  void _incrementCounter(int index) {
    setState(() {
      widget.revisions[index] += 1;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      widget.revisions[index] -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(width * 0.35),
          1: FixedColumnWidth(width * 0.36),
          2: FixedColumnWidth(width * 0.36),
          3: FixedColumnWidth(width * 0.36),
        },
        children: [
          TableRow(
            children: [
              TableCell(child: Text('')),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: TableCell(child: Center(child: Text('Package 0', style: GoogleFonts.merriweather()))),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: TableCell(child: Center(child: Text('Package 1', style: GoogleFonts.merriweather()))),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: TableCell(child: Center(child: Text('Package 2', style: GoogleFonts.merriweather()))),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('Name', style: GoogleFonts.merriweather()),
              ))),
              Padding(
                padding: EdgeInsets.only(left: width * 0.01),
                child: TableCell(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.015),
                    child: TextFormField(
                      style: GoogleFonts.merriweather(),
                      controller: widget.names[0],
                    ),
                  ),
                ),
              ),
              TableCell(
                child: TextFormField(
                  style: GoogleFonts.merriweather(),
                  controller: widget.names[1],
                ),
              ),
              TableCell(
                child: TextFormField(
                  style: GoogleFonts.merriweather(),
                  controller: widget.names[2],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('Description', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: TextFormField(
                  style: GoogleFonts.merriweather(),
                  controller: widget.descriptions[0],
                ),
              ),
              TableCell(
                child: TextFormField(
                  style: GoogleFonts.merriweather(),
                  controller: widget.descriptions[1],
                ),
              ),
              TableCell(
                child: TextFormField(
                  style: GoogleFonts.merriweather(),
                  controller: widget.descriptions[2],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('Delivery Time', style: GoogleFonts.merriweather()),
              ))),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: TableCell(
                  child: DropdownButton<String>(
                    value: widget.deliveryTimes[0].isNotEmpty ? widget.deliveryTimes[0] : null,
                    items: [
                      '1-2 Weeks',
                      '1-3 Days',
                      '3-5 Days',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.merriweather(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.deliveryTimes[0] = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: TableCell(
                  child: DropdownButton<String>(
                    value: widget.deliveryTimes[1].isNotEmpty ? widget.deliveryTimes[1] : null,
                    items: ['1-2 Weeks', '1-3 Days', '3-5 Days'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.merriweather(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.deliveryTimes[1] = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: TableCell(
                  child: DropdownButton<String>(
                    value: widget.deliveryTimes[2].isNotEmpty ? widget.deliveryTimes[2] : null,
                    items: ['1-2 Weeks', '1-3 Days', '3-5 Days'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.merriweather(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.deliveryTimes[2] = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('Revision', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.revisions[0]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () => _incrementCounter(0),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () => _decrementCounter(0),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.revisions[1]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () => _incrementCounter(1),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () => _decrementCounter(1),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.revisions[2]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () => _incrementCounter(2),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () => _decrementCounter(2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('1 Video Review', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: Checkbox(
                  value: widget.oneVideoReviews[0],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.oneVideoReviews[0] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.oneVideoReviews[1],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.oneVideoReviews[1] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.oneVideoReviews[2],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.oneVideoReviews[2] = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('3 Video Review', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: Checkbox(
                  value: widget.threeVideoReviews[0],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.threeVideoReviews[0] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.threeVideoReviews[1],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.threeVideoReviews[1] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.threeVideoReviews[2],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.threeVideoReviews[2] = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('5 Video Review', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: Checkbox(
                  value: widget.fiveVideoReviews[0],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.fiveVideoReviews[0] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.fiveVideoReviews[1],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.fiveVideoReviews[1] = value!;
                    });
                  },
                ),
              ),
              TableCell(
                child: Checkbox(
                  value: widget.fiveVideoReviews[2],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.fiveVideoReviews[2] = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                  child: Center(
                      child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text('Price', style: GoogleFonts.merriweather()),
              ))),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.prices[0]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.prices[0] += 1;
                        });
                      },
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.prices[0] -= 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.prices[1]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.prices[1] += 1;
                        });
                      },
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.prices[1] -= 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.prices[2]}',
                      style: GoogleFonts.merriweather(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(59, 129, 199, 132),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.prices[2] += 1;
                        });
                      },
                    ),
                    MaterialButton(
                      minWidth: width * 0.01,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(34, 244, 67, 54),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red.shade700,
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            widget.prices[2] -= 1;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
