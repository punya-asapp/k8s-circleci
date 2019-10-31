FROM node
RUN npm install -g newman
ADD example.postman-collection.json .
CMD newman run example.postman_collection.json
