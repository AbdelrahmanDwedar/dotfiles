return {
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			['a='] = '@assignment.outer',
			['i='] = '@assignment.inner',
			['r='] = '@assignment.rhs',
			['l='] = '@assignment.lhs',

			-- ['ab'] = '@block.outer',
			-- ['ib'] = '@block.inner',

			['ao'] = '@loop.outer',
			['io'] = '@loop.lhs',

			['af'] = '@function.outer',
			['if'] = '@function.inner',

			['ac'] = '@class.outer',
			['ic'] = '@class.inner',
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			[']c'] = '@class.outer',
			[']f'] = '@function.outer',
			[']o'] = '@loop.outer',
			[']p'] = '@parameter.outer',
		},
		goto_previous_start = {
			['[c'] = '@class.outer',
			['[f'] = '@function.outer',
			['[o'] = '@loop.outer',
			['[p'] = '@parameter.outer',
		},
		goto_next_end = {
			[']C'] = '@class.inner',
			[']F'] = '@function.inner',
			[']O'] = '@loop.inner',
			[']P'] = '@parameter.inner',
		},
		goto_previous_end = {
			['[C'] = '@class.inner',
			['[F'] = '@function.inner',
			['[O'] = '@loop.inner',
			['[P'] = '@parameter.inner',
		},
	},
	swap = {
		enable = true,
		swap_next = {
			[']]p'] = '@parameter.inner',
			[']]f'] = '@function.outer',
		},
		swap_previous = {
			['[[p'] = '@parameter.inner',
			['[[f'] = '@function.outer',
		},
	},
}
