import 'package:flutter/material.dart';
import 'package:text_chandan_23_dec/constant/colors.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({Key? key}) : super(key: key);

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  TextEditingController enterDayController =
      TextEditingController(text: "Monday");
  TextEditingController endEnterDayController = TextEditingController();

  List<String> listSchedule = [
    "08 To 10",
    "08 To 10",
    "08 To 10",
    "08 To 10",
    "08 To 10",
    "+",
  ];
  List<String> listSchedule2 = [
    "Palak",
    "Palak",
    "Palak",
    "Palak",
    "Palak",
    "+",
  ];

  List<String> listSchedule01 = [
    "Time",
    "+",
  ];
  List<String> listSchedule02 = [
    "Emp. name",
    "+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop('');
          },
          icon: const Icon(Icons.arrow_back, size: 25),
          color: Colors.white,
        ),
        title: const Text(
          "Create Schedule",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.print, size: 25),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Current Week",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_up, size: 32),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total Hrs Assigned- ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.myPrimaryColors,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                child: TextFormField(
                  controller: enterDayController,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.keyboard_arrow_up,
                          size: 32, color: Colors.black),
                      label: Text("Enter Day"),
                      border: UnderlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .27,
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.cardPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100, //New
                      blurRadius: 10.0,
                      offset: const Offset(
                        5,
                        8,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Delete",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: AppColors.myPrimaryColors,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 75,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listSchedule.length,
                      itemBuilder: (context, index) =>
                          listSchedule[index] != "+"
                              ? Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: AppColors.myPrimaryColors,
                                        width: 2,
                                        style: BorderStyle.solid,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        listSchedule[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.myPrimaryColors,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        listSchedule2[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.myPrimaryColors,
                                    size: 32,
                                  )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: TextFormField(
                  controller: endEnterDayController,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.keyboard_arrow_down,
                          size: 33, color: Colors.black),
                      label: Text("Enter Day"),
                      border: UnderlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .27,
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.cardPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100, //New
                      blurRadius: 10.0,
                      offset: const Offset(
                        5,
                        8,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Delete",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: AppColors.myPrimaryColors,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 75,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listSchedule01.length,
                      itemBuilder: (context, index) =>
                          listSchedule01[index] != "+"
                              ? Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: AppColors.myPrimaryColors,
                                        width: 2,
                                        style: BorderStyle.solid,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        listSchedule01[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.myPrimaryColors,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        listSchedule02[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.myPrimaryColors,
                                    size: 32,
                                  )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Add Shift",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: AppColors.myPrimaryColors,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
