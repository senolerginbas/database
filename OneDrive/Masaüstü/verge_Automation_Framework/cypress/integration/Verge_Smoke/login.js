///<reference types ="Cypress" />





describe ("login to Verge",()=>{
    it("Should be able to submit a successful login",()=>{
  //cy.visit('https://app.vergeag.com/signup')
  
  
      // cy.visit('https://app-dev.vergetech.dev/login')
   //cy.visit('https://app.vergeag.com/login')
  cy.visit('https://vergeag.com/')
//cy.get("a[href$='login']").eq(0).invoke('removeAttr','target')
  //  .should('have.attr', 'target')

 //cy.get('#menu-main-menu > .nav-login-link > a').invoke('removeAttr','target').click()

//cy.get('.et_pb_section_0_tb_header > .et_pb_row > .et_pb_column > .et_pb_module > .et_pb_text_inner > p > [href="https://app.vergeag.com/login"]').invoke('removeAttr','target').type("senolerginbas@gmail.com")
 //cy.get('.button-height > .mat-focus-indicator').click()
 //cy.get('#mat-input-1').type("Kanada123@!")
 //cy.get('.button-height > .mat-focus-indicator').click()

  //cy.get("a[href$='login']").eq(0).invoke('removeAttr','target').click()

  //
  
  cy.get('.et_pb_section_0_tb_header > .et_pb_row > .et_pb_column > .et_pb_module > .et_pb_text_inner > p > [href="https://app.vergeag.com/login"]').invoke('removeAttr','target').click()

  });
  

   
       
  });
    
    