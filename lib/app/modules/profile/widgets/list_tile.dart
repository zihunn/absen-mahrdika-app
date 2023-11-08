// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardListTile extends StatefulWidget {
  final Widget trailing;
  final Widget leading;
  final String text;
  final Function? onTap;
  const CardListTile({
    Key? key,
    required this.trailing,
    required this.leading,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<CardListTile> createState() => _CardListTileState();
}

class _CardListTileState extends State<CardListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => widget.onTap!(),
        leading: widget.leading,
        title: Text(widget.text),
        trailing: widget.trailing);
  }
}
