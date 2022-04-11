import 'package:contactwithblocandapi/bloc/put/cubit/updatecontact_cubit.dart';
import 'package:contactwithblocandapi/data/locator.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/cubit/addcontact_cubit.dart';

class EditContact extends StatelessWidget {
  final Contact contact;
  const EditContact({Key? key,required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdatecontactCubit>(
      create: (context) => UpdatecontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Contact'),
        ),
        body: BlocBuilder<UpdatecontactCubit,UpdatecontactState>(
          builder: (context, state) {
            print('add state ==> $state');
            if( state is UpdatecontactLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is UpdatecontactSuccess){
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
            else if(state is UpdatecontactFail){
              return const Center(child: Text('Error'),);
            }
            return ContactForm(contact: contact,);
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contact contact;

  const ContactForm({Key? key,required this.contact}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _jobController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameController.text = widget.contact.name;
    _jobController.text = widget.contact.job;
    _ageController.text = widget.contact.age;

  }
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
                    id: widget.contact.id);
                BlocProvider.of<UpdatecontactCubit>(context).updateContact(widget.contact.id!, contact);
              }
            }, child: const Text(
              'Edit Contact'
          ),
          )
        ],
      ),
    );
  }
}
