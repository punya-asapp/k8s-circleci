FROM postman/newman
ADD *.postman_collection.json .
CMD ["run", "server-example.proto.postman_collection.json", "--env-var", "baseUrl=http://server"]
