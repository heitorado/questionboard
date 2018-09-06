# CIn Question Board

This app aims to help teacher assistants at CIn-UFPE in their classes. This app works by storing students questions anonymously and sending them to a private board that only the teacher assistants can see via login and password.

It is possible to configure a Telegram bot route **[WIP]** to receive messages on Telegram as soon as they are posted. Otherwise, a page refresh is needed to see new questions.

Pull requests and suggestions are more than welcome! :heart:

* Ruby version: 2.5.1
* Rails Version: 5.2.1
* Auth System made with the [Devise Gem](https://github.com/plataformatec/devise/)
* Layout made with [Materialize](https://materializecss.com/) using the [Materialize-sass Gem](https://github.com/mkhairi/materialize-sass)

# Instructions to use
1. Fork this repo or clone it

2. Make any necessary changes to the .env file to reflect what best suits your needs (background image, page name, etc.)

3. Follow the [step by step guide provided by Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku) to deploy a Rails app. Both the hosting and the postgresql database are free.

4. You need to manually insert the users that will be allowed to see the questions, since registration is not enabled. For now the only way is to connect to the Heroku server, run rails console and setup users via "User.create". Soon there will be a rake task for that, don't worry!

## Current Ideas
* Telegram Bot integration [WIP]
* Discord bot integration [???]
* Public board with answered questions [???]
* Poll system to make lectures more engaging [???]

## About
Currently I'm just an undergraduate student that loves teaching at the Introductory Programming class. 

Feel free to contribute, send me your pull request and I'll be happy to learn more and improve this system!

Made with ❤ by [Heitorado](github.com/heitorado)
Telegram bot integration by [Valgueiro](github.com/valgueiro)
