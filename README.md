# Scheduled-Worker

As part of our Service Oriented Architecture project *RecipeBuddy*, we created
this Worker as an Schedule task, to update our data base of recipes daily.

## Install

Install this Worker by cloning the *relevant branch* and installing required gems:

    $ git clone git@github.com:Cookmasters/Scheduled-Worker.git
    $ cd Scheduled-Worker
    $ bundle install

You for this to work you will need to start the API, and set the environment
depending on the API environment.

## Testing

Test mode by running:

    $ RACK_ENV=test rake worker

## Develop

Development mode by running:

    $ rake worker

## production

This code was design to use docker containers and deploy it at heroku.

In Heroku set the `WORKER_ENV = production`

Run the task `rake worker`

## Rake tasks available

    Run the following task to find more Rake tasks:

        $ rake -T
  Divided in:

  - Run the worker
  - Docker tasks
  - Heroku tasks
