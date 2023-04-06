#!/bin/bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'autocmd User MasonToolsUpdateCompleted quitall' -c 'MasonToolsInstall'
