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
    @signatureApi = @form.signaturePad opts
    @signatureApi

  convertSignatureToImage: ->
    api = @signatureApi
    signature_image = $('#signature_drawn_signature')
    @form.on "submit", -> signature_image.val(api.getSignatureImage())

  replaceCanvasContents = (canvas, newWidth) ->
    img = new Image()
    img.src = canvas.toDataURL("image/png")
    img.onload = ->
      if (navigator.userAgent.match(/iPhone/i)) or (navigator.userAgent.match(/iPod/i)) == true
        canvas.height = 100
      canvas.width = newWidth - 2
      canvas.getContext("2d").drawImage img, 0, 0

  changeCanvasSize = (canvas) ->
    columnWidth = $('#form-container').width()
    if @mobile == true
      replaceCanvasContents(canvas, 290)
    else
      replaceCanvasContents(canvas, columnWidth)


  resizeCanvas: ->
    canvas = @canvas
    changeCanvasSize(canvas)
    window.onresize = ->
      changeCanvasSize(canvas)

$ ->
  signature = new Signature('.new_signature')
  signature.init()

