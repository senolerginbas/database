///<reference types ="Cypress" />





describe ("radio button in launchpad",()=>{
    it("Should be able to choose radio button",()=>{
  
  

  cy.visit('https://vergeag.com/')

  
  cy.get('.et_pb_section_0_tb_header > .et_pb_row > .et_pb_column > .et_pb_module > .et_pb_text_inner > p > [href="https://app.vergeag.com/login"]').invoke('removeAttr','target').click()
//   cy.get('#mat-input-0').type("senolerginbas@gmail.com")
//   cy.get('.button-height > .mat-focus-indicator').click()
//   cy.get('#mat-input-1').type("Kanada123@!")
 cy.get('[title="Main Menu"] > :nth-child(1) > .mat-icon > svg > path').click({force:true})
 cy.get('[route="/profile"] > .mat-list-item > .mat-list-item-content > .mat-list-text > [style="font-size: large;"]').click({force:true})
cy.get('#mat-radio-3 > .mat-radio-label > .mat-radio-container > .mat-radio-outer-circle').click({force:true})

 cy.get('.mat-simple-snackbar-action > .mat-focus-indicator > .mat-button-wrapper').click()
 
 

 cy.get('#mat-radio-3').should('have.class','mat-radio-button mat-accent mat-radio-checked')

// cy.get('#mat-radio-2 > .mat-radio-label > .mat-radio-container > .mat-radio-outer-circle').click({force:true})
// cy.get('.mat-simple-snackbar-action > .mat-focus-indicator').click()


});
  

   
       
  });
    
