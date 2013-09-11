python << EOF
import os
import sys
import vim

vim.command(r"set suffixesadd+=.js")

#
# walk up and check every folder for node_modules folder, 
# and if found add it to the path
#
current_folder = os.path.dirname(vim.eval("expand('%:p')"))
while current_folder is not "/":
	# print "Will check " + current_folder
	current = os.path.join(current_folder, 'node_modules')
	if os.path.exists(current): 
		# print "Will add " + current
		vim.command(r"set path+=%s" % (current.replace(" ", r"\ ")))
	current_folder = os.path.abspath(os.path.join(current_folder, '..'))
	
EOF
