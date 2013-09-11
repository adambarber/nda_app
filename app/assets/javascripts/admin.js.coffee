$ ->
  $('.signature-row').on 'click', ->
    signatureRow = $(@)
    signatureId = signatureRow.data('signatureid')
    metaDataRow = signatureRow.next()
    metaData = $(metaDataRow ).find('.signature-meta-data')
    metaData.toggleClass('open')