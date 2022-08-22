/*
 * Copyright 2022: Patrick Whelan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *          http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:calendar_app/src/core/extensions.dart';
import 'package:calendar_app/src/events/state/events.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key, required this.onFinish});

  final Function onFinish;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final _nameFieldController = TextEditingController();
  final _descriptionFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final smallScreen = context.screen == Screen.small;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              InkWell(
                child: Text(_time.format(context),
                    style: TextStyle(
                        fontSize: smallScreen ? 16 : 28,
                        color: Theme.of(context).colorScheme.primary)),
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  setState(() {
                    if (selectedTime != null) {
                      _time = selectedTime;
                    }
                  });
                },
              ),
              const Spacer(),
              InkWell(
                child: Text(DateFormat.yMMMd().format(_date),
                    style: TextStyle(
                        fontSize: smallScreen ? 16 : 28,
                        color: Theme.of(context).colorScheme.primary)),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(9999),
                    context: context,
                  );
                  setState(() {
                    if (selectedDate != null) {
                      _date = selectedDate;
                    }
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameFieldController,
            decoration: const InputDecoration(
              labelText: 'Enter Name of Event',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descriptionFieldController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    widget.onFinish();
                  }),
              const SizedBox(width: 8),
              ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    context.read<EventsNotifier>().addNewEvent(
                          Event(
                            title: _nameFieldController.text,
                            description: _descriptionFieldController.text,
                            date: _date.addTime(_time),
                          ),
                        );
                    widget.onFinish();
                  })
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _descriptionFieldController.dispose();
    super.dispose();
  }
}
