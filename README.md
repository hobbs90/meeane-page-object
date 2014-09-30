# meeane-page-object

A simple fork of Jeff Morgan's page-object gem that assists in creating flexible page objects for testing Columbus Direct websites. The goal is to facilitate creating abstraction layers in your tests to decouple the tests from the items they are testing and to provide a simple interface to the elements on a page. It works with both watir-webdriver and selenium-webdriver.

The main additions over the original page-object gem are to extend the accessors to find and interact with the particular style of radio buttons used on the Columbus Direct websites. Also, I have extended the _populate_page_with_ method to work with these page element and wait for any AJAX requests these initiate. They work in the same way as the normal radio buttons but rather than using _select_ we use _choose_.

## Additional Methods Over Original Gem

You can declare these elements using:

````ruby
label(:has_legal_expenses_cover_yes, :for => 'HasLegalExpensesCover_Yes')
````

This will add a _choose_ method in addition to the usual methods PageObjects creates for labels which allow you to select the element as you would a normal radio button. Call this using:

````ruby
choose_has_legal_expenses_cover_yes
````

The _populate_page_with method will pick these elements in exactly the same way as normal radio buttons. This means you can complete any page in the normal way using _populate_page_with_ without having to write any extra code.

````ruby
populate_page_with = data_for(:my_details, data)
````

#### Additional Setup
Many of the labels on the Columbus Direct websites (including Household & Travel) initiate an AJAX call using jQuery so the _choose_ methods generated _call wait_for_ajax_ to check the page has been updated before moving on. For this to work you need to declare the javascript library your website is using. Add the following to your env.rb file for the Columbus Direct websites:

````ruby
PageObject.javascript_framework = :jquery
````

## Improvements

Suggested improvements would be to add a facility to interact with the address widgets on the Columbus Direct pages. I'll look to add these at a later date but will use a different approach rather than forking the master as page-object gem already has an extension point that allows us to define our own Element types and register them with the gem. This would seem a better approach.

## Documentation

The project [wiki](https://github.com/cheezy/page-object/wiki/page-object) is the first place to go to learn about how to use page-object.

The rdocs for this project can be found at [rubydoc.info](http://rubydoc.info/gems/page-object/frames).

To see the changes from release to release please look at the [ChangeLog](https://raw.github.com/cheezy/page-object/master/ChangeLog)

To read about the motivation for this gem please read this [blog entry](http://www.cheezyworld.com/2010/11/19/ui-tests-introducing-a-simple-dsl/)

There is a book that describes in detail how to use this gem and others to create a complete view of testing web and other types of applications.  The book is named [Cucumber & Cheese](http://leanpub.com/cucumber_and_cheese)

## Support

If you need help using the page-object gem please ask your questions on [Stack Overflow](http://stackoverflow.com).  Please be sure to use the [page-object-gem](http://stackoverflow.com/questions/tagged/page-object-gem) tag.  If you wish to report an issue or request a new feature use the [github issue tracking page](http://github.com/cheezy/page-object/issues).

## Basic Usage

### Defining your page object

You define a new page object by including the PageObject module:

````ruby
class LoginPage
  include PageObject
end
````
    
When you include this module numerous methods are added to your class that allow you to easily define your page. For the login page you might add the following:

````ruby
class LoginPage
  include PageObject
      
  _(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'login')
end
````

Calling the _text_field_ and _button_ methods adds several methods to our page object that allow us to interact with the items on the page. To login using this page we could simply write the following code:

````ruby
login_page.username = 'cheezy'
login_page.password = 'secret'
login_page.login
````
    
Another approach might be to create higher level methods on our page object that hide the implementation details even further. Our page object might look like this:

````ruby
class LoginPage
  include PageObject
  
  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'login')
  
  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end
````

and your usage of the page would become:

````ruby
login_page.login_with 'cheezy', 'secret'
````

### Creating your page object
page-object supports both [watir-webdriver](https://github.com/jarib/watir-webdriver) and [selenium-webdriver](http://seleniumhq.org/docs/03_webdriver.html). The one used will be determined by which driver you pass into the constructor of your page object. The page object can be created like this:

````ruby
browser = Watir::Browser.new :firefox
my_page_object = MyPageObject.new(browser)
````

or

````ruby
browser = Selenium::WebDriver.for :firefox
my_page_object = MyPageObject.new(browser)
````

## Known Issues

See [http://github.com/cheezy/page-object/issues](http://github.com/cheezy/page-object/issues)

## Contribute
 
* Fork the project.
* Test drive your feature addition or bug fix. Adding specs is important and I will not accept a pull request that does not have tests.
* Make sure you describe your new feature with a cucumber scenario.
* Make sure you provide RDoc comments for any new public method you add. Remember, others will be using this gem.
* Commit, do not mess with Rakefile, version, or ChangeLog.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011-2012 Jeffrey S. Morgan. See LICENSE for details.
