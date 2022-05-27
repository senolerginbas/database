

Feature:  Login functionality 
# Scenario: Login using valid credentials  
#     Given user in application
#    And  user types admin
#    And user clicks continue
#    And users enters password TOMATER-wilful-metro-gradient-admin-21
#    And users click on continue
#    Then verify default page is displayed
   

#    Scenario: Login using  invalid  credendials
#     Given user in application
#    And  user types admin
#    And user clicks continue
#    And users enters password TOMATER-wilful-metro-gradient-admin-21\
#    And users click on continue
#    Then verify default page is not displayed 
   
@smoke
   Scenario Outline:Test Login With different credentials

 Given user in application
   And  user types <username>
   And user clicks continue
   And users enters password <password>
    And users click on continue
   Then verify default page is displayed 
  # Then verify default page is not displayed 
   Examples: 

   |username|password|
   |admin|TOMATER-wilful-metro-gradient-admin-21|
  

   Scenario Outline:Test Login With different credentials

 Given user in application
   And  user types <username>
   And user clicks continue
   And users enters password <password>
    And users click on continue
   
   Then verify default page is not displayed 
   Examples: 

   |username|password|
   
    |admin|TOMATER-wilful-metro-gradient-admin-21/|

    