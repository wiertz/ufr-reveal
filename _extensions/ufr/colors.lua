meta_colors = nil

function Meta(meta)
  -- Store metadata in a variable for use in the rest of the filter
  meta_colors = meta.color
end

function Block(el)
  -- Replace variable in the background color
  if el.attr and el.attr.attributes and el.attr.attributes.type and meta_colors and meta_colors[el.attr.attributes.type] then
    el.attr.attributes["background-color"] = pandoc.utils.stringify(meta_colors[el.attr.attributes.type])
  end
  return el
end

return {
  { Meta = Meta },
  { Block = Block }
}
