# specify the base image for this custom docker image 
FROM node:26-alpine

# copy the whole repo into the docker image 
# COPY . .

# copy specific items into the docker image
# and setup the app from specific files 

# Put our project-specific stuff into a single directory, not into
# the root of the Docker base image 
WORKDIR /app

# Copy relevant project contents into /app
COPY package*.json ./
COPY src ./src

# Install the production dependencies to run the app!
RUN npm ci --omit=dev

ARG PORT=3000
ENV PORT=${PORT}

EXPOSE ${PORT}

USER node

CMD ["npm","start"]