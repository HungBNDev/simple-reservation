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

### Examples:
  *With 12 is an argument*
  ruby main.rb 12
  *The output should be*
  You've passed the following arguments:
  12
  The Output is: 1 * Family + 3 * Double + 2 * Single = Total: $295

  *With -1 OR 13 is an argument*
  ruby main.rb -1
  *The output should be*
  You've passed the following arguments:
  -1
  The Output is: There is no option

  ruby main.rb 13
  *The output should be*
  You've passed the following arguments:
  13
  The Output is: There is no option
```
