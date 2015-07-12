{TextEditor} = require 'atom'

describe 'Language-Pawn', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-pawn')

  describe "Pawn", ->
    beforeEach ->
      grammar = atom.grammars.grammarForScopeName('source.pwn')

    it 'parses the grammar', ->
      expect(grammar).toBeTruthy()
      expect(grammar.scopeName).toBe 'source.pwn'

    it 'tokenizes functions', ->
      lines = grammar.tokenizeLines '''
        int something() {
          return 0;
        }
      '''
