Feature: Agregado de productos en el carrito de compras
  Como usuario de SwagLabs
  Quiero agregar productos al carrito y navegar correctamente
  Para poder realizar una compra

  Scenario: Agregar un producto al carrito de forma exitosa
    Given que ingreso con usuario "standard_user" y contraseña "secret_sauce"
    And estoy en la página de Products
    When hago click en el botón "Add to cart" de un producto
    And hago click en el ícono del carrito
    Then visualizo el producto agregado en la lista del carrito

  Scenario: Visualizar los productos de forma correcta
    Given que ingreso con el usuario "problem_user"
    And estoy en la página de Products
    When navego la lista de productos
    Then cada producto muestra la imagen correspondiente a su descripción
    And los productos se visualizan sin superponerse con otros elementos de la página
    And el precio del producto en la lista coincide con el precio mostrado en el carrito

  Scenario: Verificar la velocidad al navegar en la lista de productos del carrito
    Given que ingreso con el usuario "performance_glitch_user"
    And estoy en la página de Your Cart
    When navego entre la página de Products y el carrito de compras
    Then la navegación debería responder en un tiempo aceptable, sin demoras excesivas

  Scenario: Restablecer la lista de productos al ingresar con usuarios diferentes
    Given que ingreso con usuario "standard_user" y contraseña "secret_sauce"
    And estoy en la página de Products
    When agrego productos al carrito
    And hago logout
    And ingreso con el usuario "visual_user"A
    Then el carrito debería aparecer vacío y no mostrar los productos agregados por el usuario anterior

 
