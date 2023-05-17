# new feature
# Tags: optional

Feature: PestStore endpoint test
  Background:
    * def pet = 'v2/pet';

  Scenario: Añadir una mascota a la tienda
    * def body = read ('classpath:data/request/add_pet.json')
    Given url 'https://petstore.swagger.io/'
    And path pet
    And request body
    When method POST
    Then status 200
    And match response.id == body.id
    And match response.name == body.name

    @SearchPet
    Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
      * def body = read ('classpath:data/request/consultar_pet.json')
      Given url 'https://petstore.swagger.io/'
      #Given url karate.petStore
      And path pet, body.id
      When method GET
      Then status 200

    @UpdatePet
    Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
      * def new_name = 'doggie'
      * def status_sold = 'sold'
      * def body = read ('classpath:data/request/update_pet.json')
      * body.name = new_name
      * body.status = status_sold
      Given url 'https://petstore.swagger.io/'
      #Given url karate.petStore
      And path pet
      And request body
      When method PUT
      Then status 200
      And match response.name == new_name

  @SearchPetStatus
#Escenario de busqueda de mascotas actualizada
  Scenario: Buscar mascota por estado
    * def new_name = [{name: 'Captain Nikita'}]
    * def status_sold = 'sold'
    * def body = read ('classpath:data/request/consultar_pet_modificada.json')
    * body.name = new_name
    * body.status = status_sold
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method GET
    Then status 200