.PHONY: all
.DEFAULT_GOAL := all

PACKAGE := github.com/huttarichard/mailgun-go

gen:
	rm events/events_easyjson.go
	easyjson --all events/events.go
	rm events/objects_easyjson.go
	easyjson --all events/objects.go

all:
	export GO111MODULE=on; go test . -v

godoc:
	mkdir -p /tmp/tmpgoroot/doc
	-rm -rf /tmp/tmpgopath/src/${PACKAGE}
	mkdir -p /tmp/tmpgopath/src/${PACKAGE}
	tar -c --exclude='.git' --exclude='tmp' . | tar -x -C /tmp/tmpgopath/src/${PACKAGE}
	echo -e "open http://localhost:6060/pkg/${PACKAGE}\n"
	GOROOT=/tmp/tmpgoroot/ GOPATH=/tmp/tmpgopath/ godoc -http=localhost:6060
