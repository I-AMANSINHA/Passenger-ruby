FROM phusion/passenger-full:latest

# Enable Nginx and Passenger
RUN rm /etc/service/nginx/down

# Set working directory
WORKDIR /home/app/webapp

# Copy app files
COPY . /home/app/webapp

# Install dependencies
RUN bundle install

# Set correct permissions
RUN chown -R app:app /home/app/webapp

# Replace default Nginx config
COPY nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["/sbin/my_init"]

