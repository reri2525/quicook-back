FROM ruby:3.1.0

WORKDIR /back
COPY Gemfile /back/Gemfile
COPY Gemfile.lock /back/Gemfile.lock
RUN bundle install
COPY . /back

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3001

# Start the main process.
CMD ["bash", "/usr/bin/entrypoint.sh"]
