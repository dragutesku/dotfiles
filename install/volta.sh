# Install node & npm packages
# https://volta.sh/
echo "Volta installing needed packages";

volta install node;
volta install npm;

npm install -g typescript;
npm install -g eslint;
npm install -g http-server;
npm install -g nodemon;
npm install -g @angular/cli;
npm install -g next@latest;
npm install -g react@latest;
npm install -g react-dom@latest;
