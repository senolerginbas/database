///<reference types ="Cypress" />











describe ("Admin table",()=>{
    it("Should be able to choose all row elements",()=>{
  
  

  cy.visit('https://app-dev.vergetech.dev/')
  cy.get('.mat-form-field-infix').type('admin').click()
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('#mat-input-1').type('TOMATER-wilful-metro-gradient-admin-21')
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('.mat-ripple.ng-star-inserted > :nth-child(1) > .mat-icon > svg').click({force:true})
  cy.get('[title="Main Menu"] > :nth-child(1) > .mat-icon > svg > path').click({force:true})
  cy.get('[title="Admin"] > .mat-list-item > .mat-list-item-content > .mat-list-text > [style="font-size: large;"]').click({force:true})
  cy.get('[href="/admin/users"] > .mat-list-item-content').click({force:true})
  //cy.contains('mat-date-range-input','Created Date').find("mat-label.ng-star-inserted").click({force:true})
cy.get("mat-date-range-input[role='group'][formgroupname='createDate']").click({force:true})
cy.get(':nth-child(1) > .mat-focus-indicator > .mat-button-wrapper > .mat-icon > svg')
})
})

  






