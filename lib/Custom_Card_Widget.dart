import 'package:flutter/material.dart';

Widget buildCard(String label, String value, int cardIndex) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(120.0),
    ),
    margin: const EdgeInsets.only(bottom: 16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              (cardIndex + 1).toString(), 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ), 
          ),
          const SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(value,style: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    ),
  );
}
