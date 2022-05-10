///<reference types ="Cypress" />






describe ("test mouse actions",()=>{
    it("Should be able to scroll down",()=>{
  
  

  cy.visit('https://app-dev.vergetech.dev/')
  cy.get('.mat-form-field-infix').type('admin').click()
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('#mat-input-1').type('TOMATER-wilful-metro-gradient-admin-21')
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('.button-background > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('.mat-button-wrapper > .ng-star-inserted').scrollIntoView().click()
   
  })
})