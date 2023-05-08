# Install node & npm packages
volta install node
volta install npm

packages=(
    typescript
    eslint
    http-server
    nodemon
    @angular/cli
    next@latest 
    react@latest 
    react-dom@latest
)

npm install -g "${packages[@]}"
