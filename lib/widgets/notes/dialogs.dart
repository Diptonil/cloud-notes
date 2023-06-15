import 'package:flutter/material.dart';
import 'package:cloudnotes/widgets/notes/buttons.dart';


Future<bool> showSyncDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return const SyncNotesAlertDialog();
    }
  ).then((value) => value ?? false);
}


Future<bool> showFlushDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return const FlushNotesAlertDialog();
    }
  ).then((value) => value ?? false);
}


Future<bool> showDeleteDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return const DeleteNotesAlertDialog();
    }
  ).then((value) => value ?? false);
}


class SyncNotesAlertDialog extends StatelessWidget {
  const SyncNotesAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Sync Notes'),
      content: Text('This action would cause the local storage to retrieve cloud data. Continue?'),
      actions: [
        CancelButton(),
        OKButton()
      ],
    );
  }
}


class FlushNotesAlertDialog extends StatelessWidget {
  const FlushNotesAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Delete Cloud Data?'),
      content: Text('This action would cause the notes in cloud storage to be permanently deleted and it is highly not recommended. Continue?'),
      actions: [
        CancelButton(),
        OKButton()
      ],
    );
  }
}


class DeleteNotesAlertDialog extends StatelessWidget {
  const DeleteNotesAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Sync Notes'),
      content: Text('This action would cause the complete deletion of the local storage. It should not be a problem as long as data exists in the cloud. Continue?'),
      actions: [
        CancelButton(),
        OKButton()
      ],
    );
  }
}
