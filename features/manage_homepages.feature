Feature: Manage homepage
  In order to portray a good image
  The owner
  wants perfection

  Scenario: Homepage Layout
    Given I am on the home page
    Then I should see "Beilabs.com" within "h1"
    Then I should see "Blog" within "ul li"
    Then I should see "Twitter" within "ul li"
    Then I should see "GitHub" within "ul li"
    Then I should see "Last.Fm" within "ul li"
    Then I should see "Facebook" within "ul li"

    Then I should see "My Startup" within "h2"
    Then I should see "GiveFoo" within "ul li"
    Then I should see "Get in touch" within "h2"

    Then I should see "Email:" within "ul li label"
    Then I should see "jonathan@beilabs.com" within "ul li"
    Then I should see "Google Talk:" within "ul li label"
    Then I should see "jonathan@beilabs.com" within "ul li"
    Then I should see "Skype:" within "ul li label"
    Then I should see "jonathan.givefoo.com" within "ul li"
