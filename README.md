# Coffee Tasting Journal - An app to keep track of the coffees you have tasted and the information about them

## Description
This app was built for the [Flatiron School](https://flatironschool.com/) Sinatra project and is meant to let users log their coffee tasting adventures.  Users can log information about their favorite roasts or coffees they've tried, such as the coffee name, producer, roaster, etc. Users can also describe what the tasting notes are in the coffee as well as another other thoughts they have on particular coffee in the notes section, such as a rating, brew date, or preference. Users can create as many coffee logs as they would like for future reference.

## Installation
Clone this repository and execute: 
```
bundle install
```

Then execute: 
```
rake db:migrate
``` 
to create the database. 

Next, execute: 
```
rake db:seed
```
to pre-populate the database with sample users and coffees.  

Execute: 
```
shotgun
``` 
and navigate to spin-up a local server and navigate to `localhost:9393` to preview the app.

|Username	|Password|
|-----------|--------|
|H_Brown	|password|
|L_Smith	|password|
|O_King		|password|
|S_Lacey	|password|
|J_Scott	|password|

You can also add new users by signing up.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LehuaRyon/coffee_tasting_journal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/LehuaRyon/coffee_tasting_journal/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Coffee Tasting Journal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/LehuaRyon/coffee_tasting_journal/blob/main/CODE_OF_CONDUCT.md).

## Additional Links

- [Contributing](CONTRIBUTING.md)
- [License](LICENSE.md)
- [Spec](spec.md)