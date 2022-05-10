///<reference types ="Cypress" />






describe ("searchbox in launchpad",()=>{
    it("Should be able to choose from  searchbox",()=>{
  
  

  cy.visit('https://app-dev.vergetech.dev/')
  cy.get('.mat-form-field-infix').type('admin').click()
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('#mat-input-1').type('TOMATER-wilful-metro-gradient-admin-21')
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('#mat-input-3').type('B')
   cy.get('#mat-autocomplete-1>*').each(($el,index,$list)=>{
         const prod =$el.text();
         const productToselect="Bob's 40";
         if (prod===productToselect){
       $el.trigger('click')
cy.get('h4').should("have.text"," Bob's 40 Field");}
         
         
})

}) ;   
  })