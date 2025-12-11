import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // function
Future<void> register()async{
 setState(() {
   isLoading = true;
 });

 Map<String,dynamic> daftar = {
  "firstName":firstNameController.text,
  "lastName":lastNameController.text,
  "age":ageController.text,
  "email":emailController.text
 };
 var uri = Uri.parse("https://dummyjson.com/users/add");
 try {
   var respon = await http.post(uri,body: daftar);
   if(respon.statusCode == 201){
    Navigator.pushReplacementNamed(context, "/todoList");
        //ScaffoldMessenger.of(context).showSnackBar(
      //SnackBar(content: Text("Berhasil Mendaftar:")));
   }else{
    throw Exception("Periksa kembali");
   }
 } catch (e) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString()))
   );
 }finally{
  setState(() {
    isLoading = false;
  });
 }
}
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
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: "Masukkan nama pertama",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: "Masukkan nama akhir",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Masukkan Usia",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Masukkan alamat Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 232, 159, 71),
                      foregroundColor: Colors.white
                  ),
                  onPressed: isLoading ? null : register,
                    child: isLoading ? CircularProgressIndicator(
                      color: Colors.grey,
                    ) : Text("Daftar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),),
      ),
    );
  }
}