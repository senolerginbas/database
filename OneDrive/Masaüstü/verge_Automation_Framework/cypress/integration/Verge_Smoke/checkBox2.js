///<reference types ="Cypress" />




describe ("Checkbox2 in launchpad",()=>{
    it("Should be able to choose checkbox",()=>{
  
  

  cy.visit('https://vergeag.com/')

  
  cy.get('.et_pb_section_0_tb_header > .et_pb_row > .et_pb_column > .et_pb_module > .et_pb_text_inner > p > [href="https://app.vergeag.com/login"]').invoke('removeAttr','target').click()
 // cy.get('#mat-input-0').type("senolerginbas@gmail.com")
 // cy.get('.button-height > .mat-focus-indicator > .mat-button-wrapper').click()
 // cy.get('#mat-input-1').type('Kanada123@!')
  cy.get('[routerlink="/plans"] > :nth-child(1) > .mat-icon > svg').click({force:true})
cy.contains('app-single-path-plan','Home').find('[type="checkbox"]').click({force:true})
.should('have.attr','aria-checked','true')
cy.contains('app-single-path-plan','Anne').find('[type="checkbox"]').click({force:true})


  //cy.contains('class,mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin').find(input[type='checkbox']).then(checkboxs=>{cy.wrap(checkboxs).first().click({force:true})})

 //cy.get("span[class='mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin']").eq(3).click({force:true})

 //cy.get("input[type='checkbox']").eq(5).click({force:true})
 //cy.get('[data-layer="Content"]').click({force:true})
 //cy.get("span[class='mat-checkbox-label']").eq(5).click({force:true})
 //each(($elem, index) => {
  // if(index === 5) {
    //  cy.wrap($elem).click({force:true});

   // cy.get('.mat-checkbox-layout > .mat-checkbox-inner-container').eq(5).click({force:true})
 // }
//});
  

  

   
       
  });
  
  
  
  //cy.get('div[').should('have.attr','aria-checked','true')
//cy.get('input').invoke('attr', 'name').should('eq', 'username'); // Should be equal
//cy.get('input').invoke('attr', 'value').should('contain', 'username')
});