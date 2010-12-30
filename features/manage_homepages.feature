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
    Then I should see "Blog" within "#wrapper #content section ul.block li a"
    Then I should see "Twitter"
    Then I should see "GitHub"
    Then I should see "Linked-in"
    Then I should see "Last.Fm"
    Then I should see "Facebook"
    Then I should see "My startup"
    Then I should see "GiveFoo"
    Then I should see "E-Commerce for the developing world"
    Then I should see "Get in touch"
    Then I should see "Email:"
    Then I should see "jonathan@beilabs.com"
    Then I should see "Skype:"
    Then I should see "jonathan.givefoo.com"
    Then I should see "Where am I?"
    Then I should see "I have been working for:"
    Then I should see "I'm a member of these amazing groups"
    Then I should see "I love to use these tools"
    Then I should see "How's my validity?"


  @validations
  Scenario: validate
    When I am on the home page
