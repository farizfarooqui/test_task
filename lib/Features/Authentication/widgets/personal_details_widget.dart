import 'package:flutter/material.dart';
import 'package:test_task/Constant/app_colors.dart';

class PersonalDetailsWidget extends StatelessWidget {
  const PersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 15, 214, 158),
                              Colors.black87,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                            child: Text(
                              'Developer Details',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  'fariizfarooqui104@gmail.com',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Date of Birth',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  '02.11.2002',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  'Male',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Phone',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  '03133017289',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
  }
}