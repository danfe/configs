prompts=(\
        '\[\e[38;5;123m\]\u\[\e[38;5;51m\]@\[\e[38;5;45m\]\h:\[\e[38;5;39m\]\w \[\e[38;5;245m\]\$ \[\e[0;0m\]'
        '\[\e[38;5;226m\]\u\[\e[38;5;220m\]@\[\e[38;5;214m\]\h:\[\e[38;5;38m\]\w \[\e[38;5;246m\]\$ \[\e[0;0m\]'
        '\[\e[38;5;118m\]\u\[\e[38;5;49m\]@\[\e[38;5;45m\]\h:\[\e[38;5;39m\]\w \[\e[38;5;245m\]\$ \[\e[0;0m\]'
        '\[\e[38;5;190m\]\u\[\e[38;5;118m\]@\[\e[38;5;40m\]\h:\[\e[38;5;38m\]\w \[\e[38;5;246m\]\$ \[\e[0;0m\]'
        '\[\e[38;5;203m\]\u\[\e[38;5;214m\]@\[\e[38;5;220m\]\h:\[\e[38;5;38m\]\w \[\e[38;5;248m\]\$ \[\e[0;0m\]'
        '\[\e[38;5;225m\]\u\[\e[38;5;219m\]@\[\e[38;5;213m\]\h:\[\e[38;5;200m\]\w \[\e[38;5;246m\]\$ \[\e[0;0m\]'
)

export PS1="${prompts[$((RANDOM %= $((${#prompts[@]}))))]}"

