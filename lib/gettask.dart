import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetTask extends StatefulWidget {
  const GetTask({super.key});

  @override
  State<GetTask> createState() => _GetTaskState();
}

// class _GetTaskState extends State<GetTask> {
//   TextEditingController taskController = TextEditingController();
//   TextEditingController taskDescriptionController = TextEditingController();
//   var storage = GetStorage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Get Storage'),
//       ),
//       body: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 50,
//                 width: 300,
//                 margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: 'Enter Task',
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade300,
//                             width: 1.5,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade500,
//                             width: 1.5,
//                           )),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade300,
//                             width: 1,
//                           ))),
//                   controller: taskController,
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: 300,
//                 margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: 'Enter Task Description',
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade300,
//                             width: 1.5,
//                           )),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade500,
//                             width: 1.5,
//                           )),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade300,
//                             width: 1,
//                           ))),
//                   controller: taskDescriptionController,
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: 300,
//                 margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       if (taskController.text.toString() != "") {
//                         storage.write('task', [
//                           taskController.text,
//                           taskDescriptionController.text
//                         ]);
//                         Get.snackbar('Task Confirmation Message',
//                             'Task ${taskController.text} Saved Successfully !!');
//                         debugPrint(
//                             'Task : ${taskController.text.toString()}\nTask Description : ${taskDescriptionController.text.toString()}');
//                         taskController.text = '';
//                         taskDescriptionController.text = '';
//                       } else {
//                         Get.snackbar('Task Error Message',
//                             'Task Name is Mandatory to Save Tasks,\nTask Name Not Given ❌',
//                             backgroundColor: Colors.red.withOpacity(0.5),
//                             colorText: Colors.white);
//                       }
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff0065fe),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Save Task',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: 300,
//                 margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     debugPrint("The Saved Task is : ${storage.read('task')}");
//                     // debugPrint("The Saved Task is : ${storage.read('task')}");
//                     // debugPrint("The Saved Task is : ${storage.getValues().toList()[0]}");
//                     // debugPrint("The Saved Task is : ${storage.read('task')[0]}");
//                     // debugPrint('Task : ${taskController.text.toString()}\nTask Description : ${taskDescriptionController.text.toString()}');
//                   },
//                   onLongPress: () {
//                     debugPrint(
//                         "The Saved Task's Title is : ${storage.read('task')[1]}");
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff0065fe),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Read Task',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               Card(
//                 color: Colors.deepPurple.withOpacity(0.5),
//                 shadowColor: Colors.black,
//                 surfaceTintColor: Colors.white54,
//                 child: storage.isBlank!
//                     ? Center(child: Text('No Data Found'))
//                     : Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12.0, vertical: 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               'Task Name : ${storage.read('task')[0]}',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white),
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               'Task Description : ${storage.read('task')[1]}',
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.white),
//                             ),
//                             const SizedBox(
//                               height: 8,
//                             ),
//                           ],
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _GetTaskState extends State<GetTask> {
  TextEditingController taskController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  final GetStorage storage = GetStorage();
  // var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Input Field to Enter New Task Title :
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Task',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                          width: 1.5,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ))),
                controller: taskController,
              ),
            ),
            /// Input Field to Enter New Task Description :
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Task Description',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade500,
                      width: 1.5,
                    )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    )
                  )
                ),
                controller: taskDescriptionController,
              ),
            ),
            /// Elevated Button To Write/Save New Task Details :
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (taskController.text.isNotEmpty) {
                      List tasks = storage.read<List>('tasks') ?? [];
                      tasks.add({
                        'title': taskController.text,
                        'description': taskDescriptionController.text,
                      });
                      storage.write('tasks', tasks);
                      // storage.write('task', [
                      //   taskController.text,
                      //   taskDescriptionController.text
                      // ]);
                      Get.snackbar('Task Confirmation Message',
                        'Task ${taskController.text} Saved Successfully !!',
                        backgroundColor: Colors.white.withOpacity(0.5),
                        colorText: Colors.green,
                        margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8,),
                        forwardAnimationCurve: Curves.elasticInOut,
                        animationDuration: Duration(milliseconds: 1000),
                        icon: Icon(Icons.check,color: Colors.green,),
                        boxShadows: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              spreadRadius: 2
                          ),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              offset: Offset(-2, -2),
                              blurRadius: 4,
                              spreadRadius: 2
                          )
                        ]
                      );
                      debugPrint(
                          'Task : ${taskController.text.toString()}\nTask Description : ${taskDescriptionController.text.toString()}');
                      taskController.text = '';
                      taskDescriptionController.text = '';
                    } else {
                      debugPrint("Task Name is Mandatory to Save Tasks,\nTask Name Not Given");
                      Get.closeCurrentSnackbar();
                      Get.snackbar('Task Error Message',
                        'Task Name is Mandatory to Save Tasks,\nTask Name Not Given',
                        backgroundColor: Colors.white.withOpacity(0.5),
                        colorText: Colors.red,
                        margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                        forwardAnimationCurve: Curves.elasticInOut,
                        animationDuration: Duration(milliseconds: 1000),
                        icon: Icon(Icons.do_not_disturb_alt_sharp,color: Colors.red,),
                        boxShadows: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            spreadRadius: 2
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            offset: Offset(-2, -2),
                            blurRadius: 4,
                            spreadRadius: 2
                          )
                        ]
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0065fe),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Save Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            /// Elevated Button to Read Saved Task :
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: ElevatedButton(
                onPressed: () {
                  List tasks = storage.read<List>('tasks') ?? [];
                  debugPrint("Saved Tasks : $tasks");
                  // debugPrint('${storage.read('task').runtimeType}');
                  // debugPrint("The Saved Task is : ${storage.read('task')}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Read Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            /// Elevated Button to Delete Saved Task :
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: ElevatedButton(
                onPressed: () {
                  if(storage.hasData('tasks')){
                    if(storage.read('tasks')==[]){
                      setState(() {
                        storage.remove('tasks');
                      });
                    }else {
                      setState(() {
                        storage.remove('tasks');
                      });
                      debugPrint("All Tasks Deleted !");
                      Get.closeCurrentSnackbar();
                      Get.snackbar('Task Deletion Message',
                          'All Tasks Deleted!',
                          backgroundColor: Colors.white.withOpacity(0.5),
                          colorText: Colors.yellow[700],
                          margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8,),
                          forwardAnimationCurve: Curves.easeInOutExpo,
                          animationDuration: Duration(milliseconds: 500),
                          boxShadows: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                spreadRadius: 2
                            ),
                            BoxShadow(
                                color: Colors.white.withOpacity(0.8),
                                offset: Offset(-2, -2),
                                blurRadius: 4,
                                spreadRadius: 2
                            )
                          ]
                      );
                    }
                  } else{
                    debugPrint("No Tasks available to perform delete !");
                    Get.closeCurrentSnackbar();
                    Get.snackbar('Task Deletion Message',
                        'No Tasks Available to Delete!',
                        backgroundColor: Colors.white.withOpacity(0.5),
                        colorText: Colors.yellow[700],
                        margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8,),
                        forwardAnimationCurve: Curves.easeInOutExpo,
                        animationDuration: Duration(milliseconds: 500),
                        boxShadows: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              spreadRadius: 2
                          ),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              offset: Offset(-2, -2),
                              blurRadius: 4,
                              spreadRadius: 2
                          )
                        ]
                    );
                  }
                },
                onLongPress: (){
                  setState(() {
                    storage.remove('tasks');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Delete Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            /// Saved Task Details Section :
            // --------------------
            /// storage.hasData('tasks')?
            /// Card(
            ///   color: Colors.deepPurple.withOpacity(0.5),
            ///   shadowColor: Colors.black,
            ///   surfaceTintColor: Colors.white54,
            ///   margin: EdgeInsets.symmetric(horizontal: 0,vertical: 6),
            ///   child: Padding(
            ///     padding:
            ///     const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            ///     child: Column(
            ///       // mainAxisAlignment: MainAxisAlignment.start,
            ///       children: [
            ///         const SizedBox(height: 8),
            ///         Text(
            ///           'Task Name : ${storage.read('task')?[0] ?? 'No Task Name'}',
            ///           style: const TextStyle(
            ///               fontSize: 18,
            ///               fontWeight: FontWeight.w600,
            ///               color: Colors.white),
            ///         ),
            ///         const SizedBox(height: 8),
            ///         Text(
            ///           'Task Description : ${storage.read('task')?[1] ?? 'No Task Description'}',
            ///           style: const TextStyle(
            ///               fontSize: 16,
            ///               fontWeight: FontWeight.w100,
            ///               color: Colors.white),
            ///         ),
            ///         const SizedBox(height: 8),
            ///       ],
            ///     ),
            ///   ),
            /// )
            // --------------------
             storage.hasData('tasks')?
             Expanded(
               child: ListView.builder(
                 itemCount: (storage.read<List>('tasks') ?? []).length,
                 itemBuilder: (context, index) {
                   var task = storage.read<List>('tasks')?[index];
                   return Card(
                     color: Colors.white30,
                     child: ListTile(
                       title: Text(task['title']),
                       subtitle: Text(task['description']),
                       trailing: IconButton(
                         color: Colors.white,
                         style: IconButton.styleFrom(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                         ),
                         icon: Icon(Icons.delete,color: Colors.grey,),
                         onPressed: () {
                           setState(() {
                             List tasks = storage.read<List>('tasks') ?? [];
                             tasks.removeAt(index);
                             storage.write('tasks', tasks);
                             if(tasks.isEmpty){
                               storage.remove('tasks');
                             }
                           });
                           Get.snackbar('Task Deletion', 'Task "${task['title']}" Deleted');
                         },
                       ),
                     ),
                   );
                 },
               ),
             ):
             const Center(
               child: Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text('no tasks available',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
               )
             ),
          ],
        ),
      ),
    );
  }
}
