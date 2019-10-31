FROM node
RUN npm install -g newman
ADD example.postman_collection.json .
CMD newman run example.postman_collection.json
