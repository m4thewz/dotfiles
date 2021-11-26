local ok, err = pcall(require, "src")

if not ok then
  error("A error ocurred in loading configuration: \n\n" .. err)
end

