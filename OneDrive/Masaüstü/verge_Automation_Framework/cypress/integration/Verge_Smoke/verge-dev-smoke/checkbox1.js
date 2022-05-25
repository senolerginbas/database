///<reference types ="Cypress" />






describe ("Checkbox in launchpad",()=>{
    it("Should be able to choose checkbox",()=>{
  
  

  cy.visit('https://app-dev.vergetech.dev/')
  cy.get('.mat-form-field-infix').type('admin').click()
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('#mat-input-1').type('TOMATER-wilful-metro-gradient-admin-21')
  cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
  cy.get('[routerlink="/plans"] > :nth-child(1) > .mat-icon > svg').click()
 // cy.contains('app-single-path-plan','Reindal West').find('[type="checkbox"]').click({force:true})
  cy.wait(2000)
  cy.get(':nth-child(1) > .mat-list-item-content > .mat-pseudo-checkbox').click({force:true})
  cy.wait(3000)
  cy.contains('app-single-path-plan','Armstrong SF').find('[type="checkbox"]').click({force:true})
  //cy.get(':nth-child(1) > :nth-child(1) > .mat-card > .mat-card-content > :nth-child(1) > .align-self-top > [data-cy="checkbox-1"] > .mat-checkbox-layout > .mat-checkbox-inner-container').click({force:true})
  cy.get('.mat-form-field-infix > .d-flex > div > .mat-icon > svg > path').click({force:true})

  cy.contains('7 Palmas').click({force:true})
  cy.get('.noPathPlan > .mat-focus-indicator').contains('Plan')
  //should('have.text',' Create a new Path Plan ')
  //cy.get("div[placeholder='Verge Demo2']").click({force:true})
//cy.contains('div','Verge Demo').find('[placeholder="Verge Demo"]').click({force:true})
//cy.get('input[placeholder="Verge Demo"]').click({force:true})

//cy.get(').click()



});
  

   
       
  });
    
