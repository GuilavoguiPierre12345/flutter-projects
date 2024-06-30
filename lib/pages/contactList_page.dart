import 'package:easy_contact/providers/contact_provider.dart';
import 'package:easy_contact/widgets/snakeBar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        if (! context.watch<ContactProvider>().permission) context.read<ContactProvider>().activePermission();
        if ( context.watch<ContactProvider>().contacts.isEmpty) context.read<ContactProvider>().getAllContacts();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (_) => context.read<ContactProvider>().searchContact(),
                controller: context.watch<ContactProvider>().controller,
                decoration: const InputDecoration(
                  hintText: "search a contact",
                ),
              ),
            ),
            Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: context.watch<ContactProvider>().contacts.length,
                  separatorBuilder: (context,index) => const Divider(),
                  itemBuilder: (context,index) {
                    final currentContact = context.watch<ContactProvider>().contacts[index];

                    return ListTile(
                      onLongPress: (()=> {}),
                      leading: CircleAvatar(
                        backgroundColor: Colors.primaries[ index % Colors.primaries.length],
                        child: Text(currentContact.displayName[0]),
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child:  Text(currentContact.displayName,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            )
                          ),
                        ],
                      ),
                      trailing:  IconButton(
                          onPressed: () {
                            // context.read<ContactProvider>().deleteContact(currentContact.id);
                            ScaffoldMessenger.of(context).showSnackBar(SnakeBarMessage().snackBar(currentContact.displayName));
                          },
                          icon: const Icon(Icons.delete,color: Colors.red,)
                      ),
                    );
                  },
                )
            ),
          ],
        );
  }
}