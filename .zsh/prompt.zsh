# Powerline configuration
if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/zsh/powerline.zsh
else
	force_color_prompt=yes

	if [ -n "$force_color_prompt" ]; then
		if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
			# We have color support; assume it's compliant with Ecma-48
			# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
			# a case would tend to support setf rather than setaf.)
			color_prompt=yes
		else
			color_prompt=
		fi
	fi

	configure_prompt() {
		prompt_symbol=💀
		# Skull emoji for root terminal
		#[ "$EUID" -eq 0 ] && prompt_symbol=💀
		case "$PROMPT_ALTERNATIVE" in
			twoline)
				PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
				# PROMPT=$'%F{%(#.blue.green)}┌──(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
				# Right-side prompt with exit codes and background processes
				#RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
				;;
			oneline)
				PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
				RPROMPT=
				;;
			backtrack)
				PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
				RPROMPT=
				;;
		esac
		unset prompt_symbol
	}

	# The following block is surrounded by two delimiters.
	# These delimiters must not be modified. Thanks.
	# START KALI CONFIG VARIABLES
	PROMPT_ALTERNATIVE=twoline
	NEWLINE_BEFORE_PROMPT=yes
	# STOP KALI CONFIG VARIABLES

	if [ "$color_prompt" = yes ]; then
		# override default virtualenv indicator in prompt
		VIRTUAL_ENV_DISABLE_PROMPT=1

		configure_prompt

		# enable syntax-highlighting
		if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
			. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
			ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
			ZSH_HIGHLIGHT_STYLES[default]=none
			ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
			ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
			ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
			ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[path]=bold
			ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
			ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
			ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[command-substitution]=none
			ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[process-substitution]=none
			ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
			ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
			ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
			ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
			ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[assign]=none
			ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
			ZSH_HIGHLIGHT_STYLES[named-fd]=none
			ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
			ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
			ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
			ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
		fi
	else
		PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
	fi
	unset color_prompt force_color_prompt

	toggle_oneline_prompt(){
		if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
			PROMPT_ALTERNATIVE=twoline
		else
			PROMPT_ALTERNATIVE=oneline
		fi
		configure_prompt
		zle reset-prompt
	}
	zle -N toggle_oneline_prompt
	bindkey ^P toggle_oneline_prompt
fi

