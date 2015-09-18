all: \
	resource-pages

build:
	time jekyll build

_resources:
	bin/permute \
		--by resource=resources \
		-o $@/:resource.md

_states:
	bin/permute \
		--by state=states \
		-o _$@/:state.md

_offshore:
	bin/permute \
		--by area=offshore_areas \
		-o $@/:area.md

_revenue-resources: _resources
	ln -s $< $@

_revenue_all_states: _states
	ln -s $< $@

_revenue_all_offshore: _offshore
	ln -s $< $@

resource-pages: \
	resource-indexes \
	us-resources \
	onshore-resources \
	offshore-resources

resource-indexes:
	bin/permute \
		--by resource=resources \
		--set layout=resource \
		-o resource/:resource/index.html

us-resources:
	bin/permute \
		--by resource=resources \
		--by datatype=datatypes \
		--set layout=resource \
		-o resource/:resource/:datatype/index.html

onshore-resources:
	bin/permute \
		--by resource=resources \
		--by region=states \
		--by datatype=datatypes \
		--set layout=resource \
		--set shore=onshore \
		-o resource/:resource/:datatype/onshore/:region/index.html

offshore-resources:
	bin/permute \
		--by resource=resources?offshore=true \
		--by region=offshore_areas \
		--by datatype=datatypes \
		--set layout=resource \
		--set shore=offshore \
		-o resource/:resource/:datatype/offshore/:region/index.html

.PHONY: \
	resource-pages \
	resource-indexes \
	us-resources \
	onshore-resources \
	offshore-resource
