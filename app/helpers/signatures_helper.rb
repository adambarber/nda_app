module SignaturesHelper

  def drawn_signature_thumbnail(sig, opts = {})
    height = opts[:height] || 50
    image_tag(sig.drawn_signature, style: "height: #{height}px")
  end
end
