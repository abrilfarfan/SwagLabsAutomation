Feature: Reservación de vuelo
  Como usuario de AgileWay
  Quiero poder reservar un vuelo
  Para viajar a un destino determinado

# SE ASUME QUE AL SELECCIONAR "One way", EL CAMPO "Returning" NO SE MUESTRA EN LA INTERFAZ

  Scenario Outline: Reservar un vuelo ida y vuelta exitosamente
    Given que me encuentro logueado en la página de AgileWay
    When marco el tipo de viaje como <triptype>
    And selecciono el origen <from>
    And selecciono el destino <to>
    And elijo la fecha de salida <departing>
    And elijo la fecha de regreso <returning>
    And elijo el horario del vuelo <time>
    And hago click en el botón Continue
    Then el vuelo es reservado de forma exitosa

    Examples:
      | triptype | from   | to     | departing     | returning     | time       |
      | Return   | México | Canadá | 01-Apr-2025   | 10-Apr-2025   | 9:00 QF983 |
      | Return   | Chile  | Brasil | 02-May-2025   | 10-May-2025   | 8:00 QF821 |

  Scenario Outline: Reservar un vuelo solo de ida exitosamente
    Given que me encuentro logueado en la página de AgileWay
    When marco el tipo de viaje como <triptype>
    And selecciono el origen <from>
    And selecciono el destino <to>
    And elijo la fecha de salida <departing>
    And elijo el horario del vuelo <time>
    And hago click en el botón Continue
    Then el vuelo es reservado de forma exitosa

    Examples:
      | triptype | from     | to        | departing     | time       |
      | One way  | Colombia | Argentina | 15-Jun-2025   | 8:30 VA23  |


# SE ASUME QUE EL SISTEMA PERMITE SELECCIONAR FECHAS IGUALES
# Y QUE LA VALIDACIÓN SE REALIZA ÚNICAMENTE DESPUES DE HACER CLIC EN "Continue".

  Scenario Outline: Reservar un vuelo ida y vuelta ingresando fechas iguales
  Given que me encuentro logueado en la página de AgileWay
  When marco el tipo de viaje como <triptype>
  And selecciono el origen <from>
  And selecciono el destino <to>
  And elijo la fecha de salida <departing>
  And elijo la fecha de regreso <returning>
  And elijo el horario del vuelo <time>
  And hago click en el botón Continue 
  Then se visualiza el <mensaje>

  Examples: 
    | triptype | from    | to        | departing     | returning     | time       | mensaje                                             |
    | Return   | Chile   | New York  | 10-Apr-2025   | 10-Apr-2025   | 9:00 QF983 | Las fechas de salida y regreso deben ser distintas |
    | Return   | Brasil  | Argentina | 02-May-2025   | 02-May-2025   | 8:00 QF821 | Las fechas de salida y regreso deben ser distintas |


Scenario Outline: Reservar un vuelo con fecha de regreso anterior a la de salida
  Given que me encuentro logueado en la página de AgileWay
  When marco el tipo de viaje como <triptype>
  And selecciono el origen <from>
  And selecciono el destino <to>
  And elijo la fecha salida <departing>
  And elijo la fecha de regreso <returning>
  And elijo el horario del vuelo <time>
  And hago click en el botón Continue 
  Then se visualiza el <mensaje>

Examples: 
  | triptype | from  | to       | departing     | returning     | time       | mensaje                                                       |
  | Return   | Chile | Colombia | 10-Mar-2025   | 01-Mar-2025   | 8:00 QF821 | La fecha de regreso no puede ser anterior a la fecha de salida |


Scenario Outline: Reservar un vuelo con el mismo origen y destino ingresado
  Given que me encuentro logueado en la página de AgileWay
  When marco el tipo de viaje como <triptype>
  And selecciono el origen <from>
  And selecciono el destino <to>
  And elijo la fecha salida <departing>
  And elijo la fecha de regreso <returning>
  And elijo el horario del vuelo <time>
  And hago click en el botón Continue 
  Then se visualiza el <mensaje>

Examples: 
  | triptype | from  | to    | departing     | returning     | time       | mensaje                                                   |
  | Return   | Chile | Chile | 10-Apr-2025   | 20-Apr-2025   | 9:00 QF983 | El destino debe ser diferente al origen                   |
