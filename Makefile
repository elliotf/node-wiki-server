dev:
	NODE_ENV=development \
					./node_modules/.bin/nodemon -w . -e '.jade|.js|.styl' server.js

test:
	NODE_ENV=test \
					 GOOGLE_OAUTH_SECRET="test" \
					 GOOGLE_OAUTH_ID="test" \
					 GOOGLE_OAUTH_FQDN="test" \
					 APP_FQDN="testing-fqdn.rssmtp.example.com" \
					 APP_SECRET="test" \
					 APP_SMTP_HOST="smtp.example.com" \
					 APP_SMTP_PORT="465" \
					 APP_SMTP_SSL="true" \
					 APP_SMTP_FROM="no-reply@example.com" \
					 APP_SMTP_PASS="dummy password" \
					 ./node_modules/.bin/mocha --recursive test -R list

testwatch:
	DB_TOKEN="testwatch" ./node_modules/.bin/chicken -c 'clear; time make test' .

.PHONY: dev test testwatch
