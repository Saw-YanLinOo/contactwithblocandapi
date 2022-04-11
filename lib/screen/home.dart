import 'package:contactwithblocandapi/bloc/delete/cubit/deletecontact_cubit.dart';
import 'package:contactwithblocandapi/bloc/get/cubit/getcontact_cubit.dart';
import 'package:contactwithblocandapi/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_contact.dart';
import 'edit_contact.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contact'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddContact()));
          if(result != null && result == 'success'){
            BlocProvider.of<GetcontactCubit>(context).getContact();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<GetcontactCubit,GetcontactState>(
        builder: (context, state){
          if(state is GetcontactSuccess){
            List<Contact> listContact = state.contactList;
            return ListView.builder(
              itemCount: listContact.length,
              itemBuilder: (context,index){
                return contactTile(listContact[index]);
              },
            );

          }
          else if(state is GetcontatFail){
            return Center(child: Text(state.error),);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget contactTile(Contact contact){
    return Card(
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (cxt) async {
               var result = await Navigator.push(cxt, MaterialPageRoute(builder: (_)=> EditContact(contact: contact,)));

               print('edit back => $result');
               if(result != null && result == 'success'){
                 BlocProvider.of<GetcontactCubit>(context).getContact();
               }
              },
              backgroundColor: const Color(0xFF49FE52),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          //dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context){
                BlocProvider.of<GetcontactCubit>(context).deleteContact(contact.id!);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.job),
          trailing: Text(contact.age),
        ),
      ),
    );
  }
}
void slideMethod(BuildContext context,String action) {
  print('');
}
