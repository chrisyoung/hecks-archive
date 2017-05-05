module.exports = function (functionName) {
  if(functionName.indexOf('-dev-') > -1) {
    return 'osx'
  } else {
    return 'linux'
  }
}
