## Blocitoff

Deployed [here](blocitoff-jepps.herokuapp.com) on Heroku.

##### An app that lets you create self-destructing to-do lists.

To-do lists are notorious for collecting junk: to-do items that you want to remember, but are not very important and thus get consistently put-off. To address the problem of to-do list clutter, I created Blocitoff.

Blocitoff will aim to keep to-do lists manageable by automatically deleting to-do items that have not been completed after seven days. The hypothesis is that if the to-do item is not important enough to be completed in seven days, it doesn't belong on your to-do list.

Rails v4.2.4

### Important Gems
- [Devise](https://github.com/plataformatec/devise) for user authentication.
- [Bootstrap Sass](https://github.com/twbs/bootstrap-sass) for styling.
- [Figaro](https://github.com/laserlemon/figaro) for storing sensitive information.
- [Rspec](https://github.com/rspec/rspec) for unit testing.
- [Factory Girl](https://github.com/thoughtbot/factory_girl) to easily create fixtures in the testing environment.
- [Shoulda](https://github.com/thoughtbot/shoulda-matchers) for more concise tests.
- [Faker](https://github.com/stympy/faker) to create data in the development and testing environments.

Made with &hearts; by [Jkepps](http://github.com/jkepps)