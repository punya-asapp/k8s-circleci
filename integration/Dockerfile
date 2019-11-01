FROM postman/newman
ADD example.postman_collection.json .
CMD ["run", "example.postman_collection.json", "-r", "cli,junit"]
