import 'package:flutter/material.dart';
import 'package:safenest/screen/functions/water_progress_circle.dart';

class HydrationTracker extends StatefulWidget
{
  const HydrationTracker({super.key});

  @override
  State<HydrationTracker> createState()=> _HydrationTracker();
}

class _HydrationTracker extends State<HydrationTracker>
{
  double goalGlasses=8;
  double currentGlasses=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF2196F3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 8,
                ),

                TextButton(
                  onPressed: (){
                    Navigator.pop(
                        context
                    );
                  },

                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22,
                          fontWeight: FontWeight.bold,
                        ),

                        SizedBox(
                          width: 4,
                        ),

                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                ),

                SizedBox(
                  height: 4,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.water_drop_sharp,
                      size: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[200],
                    ),

                    SizedBox(
                      width: 10,
                    ),

                    Text(
                      "Hydration Tracker",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Stay hydration, stay healthy",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding:EdgeInsets.all(19),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 330,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Flexible(
                          child:Text(
                            textAlign: TextAlign.center,
                            "Tap on circle for add and double Tap for remove",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentGlasses++;
                            if(now.length<8)
                            {
                              now.add(DateTime.now());
                            }
                            else
                            {
                              now.removeAt(0);
                              now.add(DateTime.now());
                            }
                          });
                        },

                        onDoubleTap: (){
                          setState(() {
                            if(currentGlasses>0)
                            {
                              currentGlasses--;
                              if (now.isNotEmpty) {
                                now.removeLast();
                              }
                            }
                            else
                            {
                              currentGlasses==0;
                            }
                          });
                        },
                        child: WaterProgressCircle
                          (
                          currentGlasses: currentGlasses,
                          goalGlasses: goalGlasses,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  if(goalGlasses<=0)
                                  {
                                    goalGlasses=0;
                                  }
                                  else{
                                    goalGlasses--;
                                  }
                                });
                              },

                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.grey[300],
                                ),

                              child: Icon(
                                Icons.remove,
                                size: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )
                            )
                          ),

                          SizedBox(
                            width: 20,
                          ),

                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  goalGlasses++;
                                });
                              },

                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Color(0xFF2196F3),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text(
                                    "Add Glass",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.infinity,
                  height: 70 + now.length * 55,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's log",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          now.length,
                              (index){
                            return Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    fontWeight: FontWeight.bold,
                                    size: 20,
                                    color: Color(0xFF2196F3),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),

                                  Text(
                                      "${now[index].hour}: ${now[index].minute}",
                                  ),
                                  
                                  Spacer(),
                                  
                                  Text(
                                    "1 glass",
                                    style: TextStyle(
                                      color: Color(0xFF2196F3),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  
                                  Icon(
                                      Icons.done,
                                    fontWeight: FontWeight.w600,
                                    size: 20,
                                    color: Color(0xFF2196F3),
                                  )
                                ],
                              ),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}

List<DateTime> now=[];