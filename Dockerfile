# Stage 1: Build Stage
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Rebuild native modules
RUN npm rebuild better-sqlite3


# Build the application
RUN npm run build

# Stage 2: Production Stage
FROM node:18 AS production

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app/.output ./.output
COPY --from=build /app/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", ".output/server/index.mjs"]