class A  
  #类的类实例变量在访问前可以赋值也可以不赋值，不赋值就是nil  
  @alpha='This is @alpha\' value!'
  
  def A.look
   puts "#@alpha"  
  end
  
  def look 
   @alpha='This is @alpha\' value from look!' 
   puts "#@alpha"  
  end
  
  def look_again  
   puts "#@alpha"  
  end
end

A.look        #输出：'This is @alpha' value!''
a=A.new
a.look_again  #输出：'This is @alpha' value from look!'
a.look        #输出：'This is @alpha' value from look!'
puts $0
puts $$