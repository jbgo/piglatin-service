from jbgo/rvm
run mkdir /apps/piglatin-service
add . /apps/piglatin-service
workdir /apps/piglatin-service
run bundle install
expose 5555
entrypoint ruby piglatin-service.rb -p 5555