class Muppet
  constructor: (@age, @hobby) ->
  answerNanny: -> "Everything's cool!"

class SwedishChef extends Muppet
  constructor: (age, hobby, @mood) ->
    super(age, hobby)
  cook: -> 'Mmmm soup!'

describe 'About inheritance', ->
  beforeEach ->
    @muppet = new Muppet 2, 'coding'
    @swedishChef = new SwedishChef 3, 'cooking', 'chillin'

  it 'should be able to call a method on the derived object', ->
    (expect @swedishChef.cook()).toEqual('Mmmm soup!')

  it 'should be able to call a method on the base object', ->
    (expect @swedishChef.answerNanny()).toEqual("Everything's cool!")

  it 'should set constructor parameters on the base object', ->
    (expect @swedishChef.age).toEqual(3)
    (expect @swedishChef.hobby).toEqual('cooking')

  it 'should set constructor parameters on the derived object', ->
    (expect @swedishChef.mood).toEqual('chillin')

  it 'should allow instances to override class methods', ->
    gonzo = new Muppet 3, 'daredevil performer'
    gonzo.answerNanny = -> 'Hehehe!'
    (expect gonzo.answerNanny()).toBe('Hehehe!')
    (expect @muppet.answerNanny()).toBe("Everything's cool!")

  it 'should allow derived classes to override base classes', ->
    class DanishChef extends SwedishChef
      cook: -> 'Sizzle'
    redzepi = new DanishChef 30, 'foraging', 'happy'
    (expect redzepi.cook()).toBe("Sizzle")
    (expect @swedishChef.cook()).toBe("Mmmm soup!")
