-- template-blocks.lua - transform Jekyll template blocks

-- pandoc's List type
local List = require 'pandoc.List'

function table.slice (tbl, first, last)
  local first = first or 1
  local last = last or #tbl
  return table.pack(table.unpack(tbl, first, last))
end

-- Check if Para is a template block
function isTemplate (elem)
  local first = elem.content[1]
  local last = elem.content[#elem.content]
  return isStr(first) and first.c == '{%' and
         isStr(last) and last.c == '%}'
end

-- Check if node is of type Str
function isStr (node)
  return node.t == 'Str'
end

-- Check if node is of type Quoted
function isQuoted (node)
  return node.t == 'Quoted'
end

-- Process template block
function processTemplate (inlines)
  for i, node in ipairs(inlines) do
    if isStr(node) and node.c == 'include' then
      return processIncludeTemplate(table.slice(inlines, i+1))
    end
  end
  error('Unknown template type')
end

-- Process include template block
function processIncludeTemplate (inlines)
  for i, node in ipairs(inlines) do
    if isStr(node) then
      if node.c == 'callout.html' then
        return processCalloutTemplate(table.slice(inlines, i+1))
      elseif node.c == 'image.html' then
        return processImageTemplate(table.slice(inlines, i+1))
      elseif node.c == 'note.html' then
        return processNoteTemplate(table.slice(inlines, i+1))
      elseif node.c == 'tip.html' then
        return processTipTemplate(table.slice(inlines, i+1))
      end
    end
  end
end

-- Get value of content property
function getContent (inlines)
  for i, node in ipairs(inlines) do
    if isStr(node) and node.c == 'content=' then
      local content = stripQuotes(table.slice(inlines, i+1))
      return content
    end
  end
end

-- Strip Quotes around content
function stripQuotes (inlines)
  for i, node in ipairs(inlines) do
    if isQuoted(node) then
      return pandoc.walk_inline(pandoc.Span(node), { Quoted = function (elem)
        return elem.content
      end })
    end
  end
end

-- Process callout template block
function processCalloutTemplate (inlines)
  return pandoc.Para {
    pandoc.RawInline('latex', '\\begin{calloutbox}'),
    getContent(inlines),
    pandoc.RawInline('latex', '\\end{calloutbox}')
  }
end

-- Process image template block
function processImageTemplate (inlines)
  local caption = pandoc.utils.stringify(getFieldValue('caption', inlines))
  local src = pandoc.utils.stringify(getFieldValue('file', inlines))
  src = 'images/' .. src
  return pandoc.Para {
    pandoc.Image(caption, src),
    pandoc.LineBreak(),
    pandoc.Emph {
      pandoc.Str(caption)
    }
  }
end

-- Get value of the caption field
function getFieldValue (field, inlines)
  for i, node in ipairs(inlines) do
    if isStr(node) and node.c == field .. '=' then
      return stripQuotes(table.slice(inlines, i+1))
    end
  end
  return pandoc.Str()
end

-- Process note template block
function processNoteTemplate (inlines)
  return pandoc.Para {
    pandoc.RawInline('latex', '\\begin{notebox}'),
    getContent(inlines),
    pandoc.RawInline('latex', '\\end{notebox}')
  }
end

-- Process tip template block
function processTipTemplate (inlines)
  return pandoc.Para {
    pandoc.RawInline('latex', '\\begin{tipbox}'),
    getContent(inlines),
    pandoc.RawInline('latex', '\\end{tipbox}')
  }
end

return {
  {
    Para = function (elem)
      if isTemplate(elem) then
        return processTemplate(table.pack(table.unpack(elem.content, 2, #elem.content-1)))
      end
      return elem
    end
  }
}
