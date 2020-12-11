-- internal-links.lua - filter to remove internal links

-- Check if string X starts with string Y
function string.starts(String, Start)
   return string.sub(String, 1, string.len(Start)) == Start
end

-- Remove internal links
return {
  {
    Link = function (elem)
      if string.starts(elem.target, "http://") or
         string.starts(elem.target, "https://") then
        return elem
      end
      return elem.content
    end
  }
}
