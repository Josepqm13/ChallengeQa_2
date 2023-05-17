# new feature
# Tags: optional

Feature: PestStore endpoint test
  Background:
    * def pet= 'v2/pet';

  Scenario: Añadir una mascota a la tienda
    * def body = read ('classpath:data/request/add_pet.json')
    Given url karate.petStore
    And path pet
    And request body
    When method POST
    Then status 200
    And match response.id == body.id
    And match response.name == body name

    @SearchPet
    Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
      * def body = read ('classpath:data/request/consultar_pet.json')
      Given url karate.petStore
      And path petStore, body.id
      When method GET
      Then status 200

    @UpdatePet
    Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
      * def new_name = 'dinky'
      * def status_sold = 'sold'
      * def body = read ('classpath:data/request/update_pet.json')
      * body.name = new_name
      * body.status = status_sold
      Given url karate.petStore
      And path petStore
      And request body
      When method PUT
      Then status 200
      And match response.name == new_name

  Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
    * def new_name = [{name: 'dinky'}]
    * def status_sold = 'sold'
    * def body = read ('classpath:data/request/consultar_pet_modificada.json')
    * body.name = new_name
    * body.status = status_sold
    Given url karate.petStore
    And path petStore, 'findByStatus'
    And param status='sold'
    When method GET
    Then status 200
    And match $ contains body