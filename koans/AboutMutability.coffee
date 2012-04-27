describe 'About Mutability', ->
  it 'should expect object properties to be public and mutable', ->
    aPerson = firstname: 'John', lastname: 'Smith'

    aPerson.firstname = 'Alan'
    expect(aPerson.firstname).toBe('Alan')


  it 'should understand that constructed properties are public and mutable', ->
    Person = (firstname, lastname) ->
      @firstname = firstname
      @lastname = lastname

    aPerson = new Person 'John', 'Smith'
    aPerson.firstname = 'Alan'
    expect(aPerson.firstname).toBe('Alan')


  it 'should expect prototype properties to be public and mutable', ->
    Person = (firstname, lastname) ->
      @firstname = firstname
      @lastname = lastname
    Person::getFullName = -> @firstname + ' ' + @lastname

    aPerson = new Person 'John', 'Smith'
    expect(aPerson.getFullName()).toBe('John Smith')

    aPerson.getFullName = -> @lastname + ', ' + @firstname
    expect(aPerson.getFullName()).toBe("Smith, John")


  it 'should know that variables inside constructor and constructor args are private', ->
    Person = (firstname, lastname) ->
      fullName = firstname + ' ' + lastname
      @getFirstName = -> firstname
      @getLastName = -> lastname
      @getFullName = -> fullName
      @

    aPerson = new Person 'John', 'Smith'
    aPerson.firstname = 'Penny'
    aPerson.lastname = 'Andrews'
    aPerson.fullName = 'Penny Andrews'
    expect(aPerson.getFirstName()).toBe('John')
    expect(aPerson.getLastName()).toBe('Smith')
    expect(aPerson.getFullName()).toBe("John Smith")

    aPerson.getFullName = -> aPerson.lastname + ', ' + aPerson.firstname
    expect(aPerson.getFullName()).toBe('Andrews, Penny')
