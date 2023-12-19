# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version: 3.2.2

- Database creation: PostgreSQL

- Database initialization

- What I used to setup projects

  # Docker, Ruby, PostgreSQL

  ## How to setup project with Docker

  ### Make sure you have Docker and Docker compose installed before running this command

  ```
  docker compose up --build
  ```

  # Video Instruction:

  [![Watch the video](https://i.imgur.com/Psoo3gf.png)](https://youtu.be/vt5fpE0bzSY)

  ## Demo

  [![Watch the video]](https://youtu.be/JmFyjYSFpzM)

## Run the following commands for locally output

```
*For update the latest ruby-build in MacOS*
brew update && brew upgrade ruby-build

*If you are using rbenv. In case you are using rvm or asdf It work the same*
rbenv install 3.2.2
OR
rvm install 3.2.2
OR
asdf install ruby 3.2.2

### Init project
```

bundle install
rails db:create
rails db:migrate
rails db:seed

Now we're having account for user and client.
_User_
email: 'user1@example.com'
password: 'password'

_Client_
email: 'client1@example.com'
password: 'password'

```

## State Management

## With State management We will use a concept call state machine.

### For each entity need state management we need define a list of states

Example: Our data is Product and It need to have two states is [active, inactive]

Figma for design state machines:
https://www.figma.com/file/d0a3tBvKvQocPw99zo5VJn/Untitled?type=whiteboard&node-id=2-205&t=lZ0wSzUMQIJ7lHjj-0

## With a data that has many states, we also follow this way.

- Define state
- Design flow with meaning of each state.
- Apply using aasm Rubygem.

```

Fixture
![Screenshot](https://github.com/HungBNDev/simple-reservation/blob/api/auth_and_crud_for_data/project_images/product_state_machine.png)

## For API documents

This project is using swagger docs generated by ruby gem rswag. It is a combination between rspec and swagger.
Github: [!link](https://github.com/rswag/rswag)

Fixture: ![Screenshot](https://github.com/HungBNDev/simple-reservation/blob/api/auth_and_crud_for_data/project_images/api_doc.png)

## How to use the api

### In this guide I am using Postman an application that is familiar with Tech industry.

[![Watch the video](https://github.com/HungBNDev/simple-reservation/blob/api/auth_and_crud_for_data/project_images/api_with_postman.png)](https://youtu.be/F0GI4HzdQj0)
