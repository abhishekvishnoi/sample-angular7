const originalBinding = process.binding;

process.binding = function (name) {
  if (name === 'http_parser') {
    const { HTTPParser } = require('http-parser-js');
    return { HTTPParser };
  }
  return originalBinding.call(process, name);
};
