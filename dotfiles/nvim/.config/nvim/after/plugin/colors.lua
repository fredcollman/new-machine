function ColorMyPencils(color)
	color = color or "molokai"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
