Download Neovim:
	nvim-linux-x86_64.tar.gz

Extract: 
	$ tar xzvf nvim-linux-x86_64.tar.gz

To run, can use:
	$ ./nvim-linux-x86_64/bin/nvim

To install, move to directory:
	$ sudo mv ./nvim-linux-x86_64/ /opt/

Add to ~/.bashrc (or ~/.zshrc):
	# nvim newer call
	export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
