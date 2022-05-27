import { Given, And, Then, When,Before } from "cypress-cucumber-preprocessor/steps";
Given('user in application', () => {
   cy.visit('https://app-dev.vergetech.dev/')
})
And('user types {word}', (username) => {
   cy.get('.mat-form-field-infix').type(username).click()
})

And('user clicks continue', () => {
   cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
})
And('users enters password {word}', (username) => {
   cy.get('#mat-input-1').type(username)
})

And('users click on continue', () => {

cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
})
Then('verify default page is displayed', () => {
cy.get('[routerlink="/"] ,> .menu-text',{timeout:60000}).should('contain.text','Home')
//cy.url().should('include', 'https://app-dev.vergetech.dev/')

})

 Then('verify default page is not displayed', () => {

 
 cy.get('.alert',{timeout:60000}).should('contain.text','Oops Invalid username or password.')
   //cy.url().should('include', 'https://app-dev.vergetech.dev/login')



})








