import 'package:contactwithblocandapi/data/locator.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/cubit/addcontact_cubit.dart';

class AddContact extends StatelessWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddcontactCubit>(
      create: (context) => AddcontactCubit(getIt.call()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Contact'),
          ),
          body: BlocBuilder<AddcontactCubit,AddcontactState>(
            builder: (context, state) {
              print('add state ==> $state');
              if( state is AddcontactLoading){
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is AddcontactSuccess){
                return Center(
                  child: Column(
                    children: [
                      const Text('Success'),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context,'success');
                        }, child: const Text(
                        'Home'
                      )),
                    ],
                  ),
                );
              }
              else if(state is AddcontactFail){
                return const Center(child: Text('Error'),);
              }
              return const ContactForm();
            },
          ),
        ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({ Key? key }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(border:OutlineInputBorder(),
            hintText: 'Enter Name',
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Enter your name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(border:OutlineInputBorder(),
            hintText: 'Enter Age',
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Enter your age';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _jobController,
            decoration: const InputDecoration(border:OutlineInputBorder(),
            hintText: 'Enter Job',
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Enter your job';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                Contact contact = Contact(
                    name: _nameController.text,
                    job: _jobController.text,
                    age: _ageController.text,
                    id: '');
                BlocProvider.of<AddcontactCubit>(context).addContact(contact);
              }
            }, child: const Text(
            'Add Contant'
          ),
          )
        ],
      ),
    );
  }
}
