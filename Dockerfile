# specify the base image for this custom docker image 
FROM node:26-alpine

# copy the whole repo into the docker image 
# COPY . .

# copy specific items into the docker image
# and setup the app from specific files 

# Put our project-specific stuff into a single directory, not into
# the root of the Docker base image 
WORKDIR /app

# this can potentially always be 3000
# so it doesn't change,
# so it's safe to move up in the file a.k.a moving down in the image layers
ARG PORT=3000
ENV PORT=${PORT}

# Copy relevant project contents into /app
COPY package*.json ./





# Install the production dependencies to run the app!
# RUN npm ci --omit=dev
RUN --mount=type=cache,target=/root/.npm npm ci --omit=dev


# move this to AFTER you install dependencies
# because you typically edit your server code more often than
# you would add or change dependencies or other package.json file content
COPY src ./src











# regular user
USER node
# things after this point will be done as if from a regular user, NOT the admin user 

EXPOSE ${PORT}
CMD ["npm","start"]