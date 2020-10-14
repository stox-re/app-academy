/*
  Generating package.json with 'npm init'
  Very similar to ruby's Gemfile

  Running 'npm init --yes' creates the package.json with the default boilerplate
*/


/*
  Once you've generated a package.json, you can start installing NPM packages
  such as react and redux via the command line:

  npm install <package_name>

  It adds it to the package.json unless you specificy --no-save flag
*/

/*
  npm install react redux

  Adds it to the dependencies on the package.json

  You can use --save-dev to specifiy packages for the development environment only
  if using different packages for development and production.
*/

/*
  anyone can download all dependencies for the app by running

  npm install
*/

/*
  Recall that, in Ruby, running bundle exec some_command is not the same
  as running some_command. In the former, the Gemfile-specified version
  of some_command is run, while in the latter, the local version is run.
  Omitting bundle exec when running commands can cause errors if our app isn't compatible with the local version.

  To solve this issue with NPM packages, we add "scripts" for any packages
   that we intend to call from the command line. Once we've added a script for a package, we can use:

   npm run <package_name>

   This ensures we run the package.json version
*/

/* For Webpack

  "scripts": {
    "webpack": "webpack --mode=development",
  }

  Now, when you run npm run webpack in the terminal, the package.json-specified version will run.

*/

/*

  Summary

  npm init --yes: Initializes an app with NPM by generating a boilerplate package.json.
  npm install <package_name>: Installs and lists a NPM package as a dependency in a package.json.
  npm install: Downloads all JavaScript dependencies listed in a package.json.

  Add a webpack script to enable npm run webpack.
*/