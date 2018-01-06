FROM soumyaray/ruby-http:2.4.3

WORKDIR /worker

COPY / .

RUN bundle install

CMD rake worker

# LOCAL:
# Build local image with:
#   rake docker:build
# or:
#   docker build --rm --force-rm -t cookmasters/recipebuddy-update_recipes:0.1.0 .
#
# Run and test local container with:
#   rake docker:run
# or:
#   docker run -e --rm -it -v $(pwd)/config:/worker/config -w /worker cookmasters/recipebuddy-update_recipes:0.1.0 ruby worker/update_recipes.rb

# REMOTE:
# Make sure Heroku app exists:
#   heroku create cookmasters-scheduled_worker
#
# Build and push to Heroku container registry with:
#   heroku container:push web
# (if first time, add scheduler addon to Heroku and have it run 'worker')
#
# Run and test remote container:
#   heroku run worker
# or:
#   heroku run ruby worker/update_recipes.rb
