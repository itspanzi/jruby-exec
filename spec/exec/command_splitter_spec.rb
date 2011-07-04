require 'exec/command_splitter'
describe Exec::CommandSplitter do

  include Exec::CommandSplitter

  it "should split based on space" do
    split_command("ruby hello_world.rb").should == ["ruby", "hello_world.rb"]
  end

  it "should consider quoted strings as a single arg" do
    split_command("ruby -e \"hello world\"").should == ["ruby", "-e", "hello world"]
  end

  it "should consider many quoted strings as a single arg" do
    split_command("ruby \"second arg\" -e \"hello world\"").should == ["ruby", "second arg","-e", "hello world"]
  end

end
