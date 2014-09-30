## welcome to [Errupt](http://infinite-lake-6652.herokuapp.com/).


As developers, we often run in to errors and it's our job to figure out how to fix it. We may spend minutes, hours, or even days trying to fix one error, losing some hairs and tempers along the way. The routine is almost always the same. If we can't pinpoint the solution to a problem right away, we usually try some assumptions, google for the error, or ask another dev buddy if they have any idea how to fix it.

But when was the last time you took a few minutes to write down a big error you ran in to, along with how you finally solved it, and maybe even took note of which approaches did not work? What if a few weeks, months or even years down the road, yourself, a friend or a colleague runs in to the same exact error. Will you remember how you resolved it the first time? It's possible that you may not remember at all. You may have to look through your code from a previous project and try to figure out how your solution, or spend hours trying to find that one google search result which had the answer. It all boils down to time wasted.

Enter Errupt.

Errupt allows you to keep a log of errors, along with screenshots and additional details such as the technologies you are using, including the language and framework version numbers. These small details can make a big difference. It could turn out to be that the way you solve an error in Ruby on Rails 3 may not be the same as how you would solve it in Rails 4. Keeping a detailed error log helps you and other developers approach a problem with more knowledge while reducing the chance of having to do the same work twice.

#### Features:

* Log errors as they occur
* Log multiple solutions, including ones that didn't work
* Tag error logs to find them easily
* A dashboard gives you a simple overview
* Detailed log attributes such as software version numbers give you meaningful insights
* Access to error solutions posted by others to help you solve your own

#### This product is still under development. Please report any bugs you come across.

Technologies used:

``` ruby
Rails 4.1.4
Ruby 2.0
postgreSQL
gem 'devise', '~> 3.3.0' #(user authentication)
gem 'paperclip', '~> 4.2.0' #(image uploads)
gem 'aws-sdk', '1.53.0' #(image hosting)
gem 'foundation-rails', '5.3.3.0' #(layout and styling)
gem 'will_paginate', '~> 3.0' #(pagination)
```

#### In the works:

This app was written with a TDD approach for models and controllers. The test suite has a lot to room to grow, and I'll be adding more along the way. 

Testing is done with rspec. To run the suite, bundle first and run rspec. For a detailed coverage report, uncomment lines 1-2 in the rails helper for SimpleCov. Ther are 4 tests in the errorlogs controller spec which may fail due to how user authentication is handled. This needs to be worked on. Integration tests are also needed.

Some DB queries need to be optimized for better performance.

Additional features and bug fixes will be added, but current version should meet the most basic needs.