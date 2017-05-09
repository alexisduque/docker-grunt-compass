FROM node:argon-alpine

 #compass 
RUN apk add --update build-base openssl libffi-dev ruby ruby-dev ruby-rdoc ruby-irb git
RUN wget https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/index.rubygems.org/GlobalSignRootCA.pem -P /usr/lib/ruby/2.3.0/rubygems/ssl_certs
RUN gem install sass compass --no-ri --no-rdoc
RUN npm install -g grunt bower normalize-scss  --production
RUN apk del libffi-dev openssl ruby-dev \
    && rm -rf /var/cache/apk/*

CMD ["node"]
