from jbgo/rvm
ENV PATH /usr/local/rvm/rubies/ruby-2.0.0-p247/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
run mkdir /apps/piglatin-service
add . /apps/piglatin-service
workdir /apps/piglatin-service
run bundle install
expose 5555
entrypoint ruby piglatin-service.rb -p 5555
