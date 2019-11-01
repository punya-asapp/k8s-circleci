FROM golang
RUN mkdir /src
WORKDIR /src
ADD *.go ./
RUN go build -o example .

FROM ubuntu
COPY --from=0 /src/example /
CMD /example
