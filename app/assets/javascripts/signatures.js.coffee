# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Signature

  constructor: (form) ->
    @form = $(form)
    @canvas = @form.find('canvas')[0]

  init: ->
    @pad()
    @convertSignatureToImage()
    @resizeCanvas()

  pad: (element) ->
    opts = { drawOnly: true,  output: "#signature_drawn_signature", bgColour : 'transparent', lineColour: 'transparent' }
    @form.signaturePad opts

  convertSignatureToImage: ->
    api = @form.signaturePad()
    signature_image = $('#signature_drawn_signature')
    @form.on "submit", -> signature_image.val api.getSignatureImage()

  replaceCanvasContents = (canvas, newWidth) ->
    img = new Image()
    img.src = canvas.toDataURL("image/png")
    img.onload = ->
      canvas.width = newWidth
      canvas.getContext("2d").drawImage img, 0, 0

  changeCanvasSize = (canvas) ->
    windowWidth = $(window).width()
    if windowWidth < 767
      replaceCanvasContents(canvas, 398)
    else if windowWidth < 992
      replaceCanvasContents(canvas, 748)
    else if windowWidth < 1200
      replaceCanvasContents(canvas, 801)
    else if windowWidth > 1200
      replaceCanvasContents(canvas, 968)

  resizeCanvas: ->
    canvas = @canvas
    changeCanvasSize(canvas)
    window.onresize = ->
      changeCanvasSize(canvas)

$ ->
  signature = new Signature('.new_signature')
  signature.init()

