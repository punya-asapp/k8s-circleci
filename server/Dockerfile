FROM golang
RUN mkdir /src
WORKDIR /src
ADD example.go .
RUN go build -o example .

FROM ubuntu
COPY --from=0 /src/example /
CMD /example
