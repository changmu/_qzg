#/bin/bash
set -e

mkdir -p $GOPATH/src/golang.org/x/
cd $GOPATH/src/golang.org/x/
git clone https://github.com/golang/tools.git
git clone https://github.com/golang/lint.git

go install $GOPATH/src/golang.org/x/lint/golint
go get -v github.com/sqs/goreturns