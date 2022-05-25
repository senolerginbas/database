///<reference types ="Cypress" />











describe ("Admin tables",()=>{
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
 

  cy.get('#excel-table tbody tr:nth-child(1) td').each(($el)=>{
cy.log($el.text())

cy.get('#excel-table tbody tr').eq(1).within (()=>{

cy.get('td').each(($el)=>{
    cy.log($el.text())
})
})

})
  


// we can add an if statetment to check if text includes ...
// fertch all cell
// cy.get('#excel-table tbody tr').each(($row)=>{
//     cy.wrap($row).within(()=> {
//         cy.get('td').each(($col)=>{
//             cy.log($col.text())
//         })

//     })

// }) 



    })


      
})
