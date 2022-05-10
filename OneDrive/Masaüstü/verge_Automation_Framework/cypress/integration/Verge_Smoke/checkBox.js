///<reference types ="Cypress" />





describe ("Checkbox in launchpad",()=>{
    it("Should be able to choose checkbox",()=>{
  
  

  cy.visit('https://vergeag.com/')

  
  cy.get('.et_pb_section_0_tb_header > .et_pb_row > .et_pb_column > .et_pb_module > .et_pb_text_inner > p > [href="https://app.vergeag.com/login"]').invoke('removeAttr','target').click()

//   cy.get('.button-height > .mat-focus-indicator').click()
//   cy.get('#mat-input-1').type("Kanada123@!")
cy.get('[title="Main Menu"] > :nth-child(1) > .mat-icon > svg').click()

cy.get('[route="/plans"] > .mat-list-item > .mat-list-item-content').click()

cy.get(':nth-child(1) > .mat-list-item-content > .mat-pseudo-checkbox').click({force:true})
.should('have.class','mat-pseudo-checkbox ng-star-inserted mat-pseudo-checkbox-checked')

cy.get(':nth-child(2) > .mat-list-item-content > .mat-pseudo-checkbox').click({force:true})
.should('have.class','mat-pseudo-checkbox ng-star-inserted mat-pseudo-checkbox-checked')

cy.get(':nth-child(1) > .mat-list-item-content > .mat-pseudo-checkbox').click({force:true})
.should('have.class','mat-pseudo-checkbox ng-star-inserted')

cy.get('#mat-checkbox-7 > .mat-checkbox-layout > .mat-checkbox-inner-container').click({force:true})



cy.get('#mat-checkbox-7-input').should('have.attr','aria-checked','true')
//cy.get('input').invoke('attr', 'name').should('eq', 'username'); // Should be equal
//cy.get('input').invoke('attr', 'value').should('contain', 'username')
});
  

   
       
  });
    
