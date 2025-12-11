import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text("SILAHKAN REGISTRASI",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan nama pertama",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan nama akhir",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan USia",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan alamat Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
            ],
          ),),
      ),
    );
  }
}