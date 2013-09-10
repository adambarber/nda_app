# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Signature

  pad: (element) ->
    opts = { drawOnly: true, lineTop: 180, output: "#signature_drawn_signature", lineMargin: 20 }
    $(element).signaturePad opts

$ ->
  signature = new Signature
  signature.pad('.new_signature')