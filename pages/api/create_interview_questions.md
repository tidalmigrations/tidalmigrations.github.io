---
toc: false
title: Creating Interview Questions
keywords: apps, interview, questions
last_updated: Sep 11, 2018
summary: "Create new interview questions with the Tidal API"
sidebar: main_sidebar
permalink: createinterviewquestions.html
---

# Creating Interview Questions

## Custom Field

Our interview questions are tightly coupled with our application fields. So before we can create an interview question, it needs to have an associated field on applications.

### Create a custom field

You can create a custom field for an application by going to https://\<domain\>.tidalmg.com/#/admin and clicking on the 'New Application Field' button. Note, we don't limit the type of field that can be used in interview questions.


### Get a custom field id

Once a field has been created, we need to get the field id. To start we need to get a list of all fields for applications

    curl -H Authorization\:\ \"Bearer\ <auth token>\" -H Content-Type\:\ application/json\
         -XGET https\://<domain>.tidalmg.com/api/v1/fields\?model_type\=applications -o fields.json

Then we need to search for our newly created field name, if you have 'jq' installed you can use it to query the json file for your field name

    jq '.[] | select(.name=="Your Field Name")' fields.json

Which should give you an output similiar to

    {  "id": 1,  "name": "Total users",  "model_type": "applications",
      "field_type": "number",
      "options": null,
      "created_at": "2018-09-05T18:22:44.080Z",
      "updated_at": "2018-09-05T18:22:44.080Z",
      "field_category": "Service Management",
      "unit": "other",
      "aggregation": "Sum",
      "measurable": null,
      "pack_id": null,
      "intended_type": null,
      "internal_type": "custom",
      "currency_id": null,
      "field_options": []
    }


## Custom Question

### Get a question number

Before we can create our question we need to know what number to give our question. To find out what number we should use, we can either look at our interview questions in our web app, or we can query the API for all questions

    curl -H Authorization\:\ \"Bearer\ <auth token>\"\ -H Content-Type\:\ application/json\
    -XGET https\://<domain>.tidalmg.com/api/v1/questions -o questions.json

Now because our api returns all questions, in order based on their number we can use 'jq' again to quickly find the last question.

    jq '.[-1]' questions.json

This will return us something like the question below, where you can see the number that this question has is 21.

    {
      "id": 22,
      "text": "This is a sample question",
      "number": 21,
      "field_id": 24,
      "created_at": "2018-09-06T18:06:41.524Z",
      "updated_at": "2018-09-06T20:44:56.266Z",
      "include_attachment": false,
      "order": 1,
      "field": {
        "id": 24,
        "name": "description",
        "model_type": "applications",
        "field_type": "multiline",
        "options": null,
        "created_at": "2018-09-05T18:22:45.132Z",
        "updated_at": "2018-09-05T18:22:45.132Z",
        "field_category": null,
        "unit": "other",
        "aggregation": "Sum",
        "measurable": null,
        "pack_id": null,
        "intended_type": null,
        "internal_type": "property",
        "currency_id": null,
        "field_options": []
      }
    }

### Create a question

Now that we have gathered the field id and the question number, we can create create our question.

To start off with all POST request to the Tidal API need to have the model type of the object they want to create as the first key in the JSON object. Then, inside that object you need to have the appropriate parameters. For questions, that is "text", "number", and "field<sub>id</sub>". An example can be found below

    {"question": { "text": "How many users does this application have?", "number": 22, "field_id": 1}}

Putting this all together we can then post this request to our API

    curl -i -H Authorization\:\ \"Bearer\ <auth token>\"\ -H Content-Type\:\ application/json\
         -XPOST https\://<domain>.tidalmg.com/api/v1/questions -d \{\"question\"\:\ \{\ \"text\"\:\ \"How\ many\ users\ does\ this\ application\ have\?\"\,\ \"number\"\:\ 23\,\ \"field_id\"\:\ 1\}\}

### Updating an existing quesiton

If you have an interview question already and you want to change the number or change what field it applies to you can do a put request

    curl -i -H Authorization\:\ \"Bearer\ <auth token>\" -H Content-Type\:\ application/json
    -XPUT http\://<domain>.tidalmg.com/api/v1/questions/22 -d \{\"question\"\:\ \{\ \"field_id\"\:\ <set id>\,\ \"number\"\:\ <set number>\}\}
