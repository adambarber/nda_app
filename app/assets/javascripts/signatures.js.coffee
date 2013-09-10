# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Signature

  constructor: (form) ->
    @form = $(form)

  pad: (element) ->
    opts = { drawOnly: true, lineTop: 180, output: "#signature_drawn_signature", lineMargin: 20, bgColour : 'transparent' }
    @form.signaturePad opts

  convertSignatureToImage: ->
    api = @form.signaturePad()
    signature_image = $('#signature_drawn_signature')
    @form.on "submit", ->
      signature_image.val api.getSignatureImage()

$ ->
  signature = new Signature('.new_signature')
  signature.pad()
  signature.convertSignatureToImage()