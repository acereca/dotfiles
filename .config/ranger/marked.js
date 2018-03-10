var marked = require('marked');
var fs = require('fs');
var TerminalRenderer = require('marked-terminal');

marked.setOptions({
  // Define custom renderer
  renderer: new TerminalRenderer()
});

// Show the parsed data
console.log(marked(fs.readFileSync(__dirname + "$1").toString()));
