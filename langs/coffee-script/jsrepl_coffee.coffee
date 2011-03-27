$ = jQuery
class JSREPL::Engines::CoffeeScript
  constructor: (@input_func, @output_func, @result_func, @error_func)->
    @sandbox = $('<iframe/>', src:'langs/coffee-script/sandbox.html',style: 'display:none').appendTo('body')
    @sandbox = @sandbox[0].contentWindow
    @sandbox.console.log = (a)=>
      @output_func(a + '\n')

  Destroy: ->
    $('iframe').remove()

  Eval: (command)->
    console.log @sandbox
    try
      @result_func(@sandbox.CoffeeScript.eval(command, globals:on, bare:on))
    catch e
      @error_func e

  Highlight: (element)->
   
