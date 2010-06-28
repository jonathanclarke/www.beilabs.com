Feature: Manage homepage
  In order to portray a good image
  The owner
  wants perfection

  Scenario: Homepage Layout
    Given I am on the home page
    Then I should see "Jonathan Clarke" within "#wrapper header h1 a"
    Then I should see "is a software engineer hailing from Kerry, Ireland who has a love of the web, engineering and all things charitable." within "#wrapper header h1"
    When I follow "Jonathan Clarke"
    Then I should be on the home page
    Then I should see "My stuff on the web" within "#wrapper #content section h1"
    Then I should see "Blog" within "#wrapper #content section ul.block li"
    Then I should see "Twitter" within "#wrapper #content section ul.block li"
    Then I should see "GitHub" within "#wrapper #content section ul.block li"
    Then I should see "Linked-in" within "#wrapper #content section ul.block li"
    Then I should see "Last.Fm" within "#wrapper #content section ul.block li"
    Then I should see "Facebook" within "#wrapper #content section ul.block li"
    Then I should see "My startup" within "#wrapper #content section h1"
    Then I should see "GiveFoo" within "#wrapper #content section ul li a"
    Then I should see "E-Commerce for the developing world" within "#wrapper #content section ul li"
    Then I should see "( October 2010 )" within "#wrapper #content section ul li span"
    Then I should see "Get in touch" within "#wrapper #content section h1"
    Then I should see "Email:" within "#wrapper #content section ul li label"
    Then I should see "jonathan@beilabs.com" within "#wrapper #content section ul li"
    Then I should see "Skype:" within "#wrapper #content section ul li label"
    Then I should see "jonathan.givefoo.com" within "#wrapper #content section ul li"
    Then I should see "Where am I?" within "#wrapper #content section h1"
    Then I should see "I have been working for:" within "#wrapper #content section h1"
    Then I should see "I'm a member of these amazing groups" within "#wrapper #content section h1"
    Then I should see "I love to use these tools" within "#wrapper #content section h1"
    Then I should see "How's my validity?" within "#wrapper footer ul li a"


  @validations
  Scenario: validate
    When I am on the home page
