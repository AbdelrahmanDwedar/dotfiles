local k = require('config.snips.base')


k.ls.add_snippets('php', {
	k.s('relation', {
		k.t('public function '),
		k.i(0, 'model'),
		k.t(': '),
		k.i(1),
		k.t('\n{\n'),
		k.t('return $this->'),
		k.i(1),
		k.t('('),
		k.i(0),
		k.t('::class);\n}'),
	}),
})
