describe "Features:", ->
  app=$('')

  beforeEach module "bowlingApp"
  beforeEach module "views/main.html"
  beforeEach inject ($compile, $rootScope)->
    html = '''
      <div ng-app="bowlingapp">
        <div ng-view=""></div>
      </div>
    '''
    app = ($compile html) $rootScope.$new()
    $rootScope.$digest()

  expectRollsDisplayToBe = (str)-> (expect app.find('.rolls').text()).toBe str
  roll = (pins)-> app.find('.roll').eq(pins).click()

  it "have the correct heading",->
    (expect app.find('h1').text()).toBe "Superheroic Bowling"

  describe "data entry", ->
    describe "data input means", ->
      it "should have 11 buttons for rolls", ->
        (expect app.find('.roll').length).toBe 11
      it "should have a reset button", ->
        (expect app.find('.reset').length).toBe 1

    describe "data display means", ->
      it "should display a initially empty list of rolls", ->
        expectRollsDisplayToBe "[]"

      it "should roll a gutter ball", ->
        roll(0)
        expectRollsDisplayToBe "[0]"

      it "should roll a non-gutterball", ->
        roll(5)
        expectRollsDisplayToBe "[5]"

      it "should roll more than one roll", ->
        roll(0); roll(1)
        expectRollsDisplayToBe "[0,1]"

      it "should display an empty list on reset", ->
        roll(0)
        app.find('.reset').click()
        expectRollsDisplayToBe "[]"
