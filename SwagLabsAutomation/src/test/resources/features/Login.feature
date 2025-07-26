Feature: Inicio de Sesion
  Como usuario de SwagLabs
  Quiero poder iniciar sesión
  Para acceder a las funcionalidades

  Scenario: Iniciar sesión de forma exitosa
    Given que me encuentro registrado en la página de SwagLabs
    When ingreso mi nombre de usuario "standard_user"
    And ingreso mi contraseña "secret_sauce"
    And hago click en el botón Login
    Then puedo ingresar a la página principal

  Scenario Outline: Intentar iniciar sesión de forma incorrecta
    Given que me encuentro en la página de SwagLabs
    When ingreso mi nombre de usuario "<username>"
    And ingreso mi contraseña "<password>"
    And hago click en el botón Login
    Then se muestra el mensaje de error "<mensaje>"

    Examples:
      | username         | password       | mensaje                                                                    |
      | standard_user    | wrong_password | Epic sadface: Username and password do not match any user in this service  |
      | wrong_user       | secret_sauce   | Epic sadface: Username and password do not match any user in this service  |
      | locked_out_user  | secret_sauce   | Epic sadface: Sorry, this user has been locked out.                        |
      |                  | secret_sauce   | Epic sadface: Username is required                                         |
      | standard_user    |                | Epic sadface: Password is required                                         |
