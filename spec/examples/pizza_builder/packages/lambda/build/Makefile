@echo 'Run the app locally'
@echo '-------------------'
@rm -fr $(OSXDIR)
@mkdir -p $(OSXDIR)/lib/ruby
@tar -xzf resources/traveling-ruby-20150715-2.2.2-osx.tar.gz -C $(OSXDIR)/lib/ruby
@mkdir $(OSXDIR)/lib/app
@cp hello_ruby/lib/hello.rb $(OSXDIR)/lib/app/hello.rb
@cp resources/wrapper.sh $(OSXDIR)/hello
@chmod +x $(OSXDIR)/hello
@cd $(OSXDIR) && ./hello
