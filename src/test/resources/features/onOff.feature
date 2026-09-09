Feature: Interruptor inteligente
  Como tester quiero probar la funcionalidad de interruptor inteligente

  Background:
    * url 'https://statemachine--maria7221.replit.app/api/'
    * headers { Content-Type: 'application/json', Accept: 'application/json' }

  Scenario: Verificar el estado del interruptor en un momento dado
    Given path 'switch/state'
    When method get
    Then status 200
    * print 'Estado actual del interruptor:', response.state
    * match response contains { state: '#present' }

  @smoke
  Scenario: El endpoint de salud responde ok
    Given path 'healthz'
    When method get
    Then status 200
    And match response == { status: 'ok' }

  @smoke
  Scenario Outline: GET <endpoint> responde 200 con un JSON valido
    Given path '<endpoint>'
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == '#object'

    Examples:
      | endpoint     |
      | healthz      |
      | switch/state |
      | auth/state   |

  @ignore @doOn
  Scenario: Do Turn On
    Given url 'https://statemachine--maria7221.replit.app/api/'
    And path 'switch/on'
    And headers { Content-Type: 'application/json', Accept: 'application/json' }
    And headers 'Content-Length': '0'
    When method post
    * print 'Response status when state is Off and do On :', responseStatus
    * match responseStatus == 200
    * match response == { state: 'on' }
