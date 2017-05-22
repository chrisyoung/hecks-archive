# Adding these folders to the load path allows specs to be run
# with no gems installed
%w{dynamodb resource_server memory_database sql_database }.each do |file|
  path = File.dirname(__FILE__) + '/../adapters/' + file + '/lib/'
  $LOAD_PATH.unshift(path)
end

%w{application domain}.each do |file|
  $LOAD_PATH.unshift(File.dirname(__FILE__) + '/../' + file + '/lib/')
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib/')
