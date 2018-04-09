classdef Feature   
    properties
      name
      format
    end
   
    methods
      function f = Feature(name, format)
         f.name = name; 
         f.format = format; 
      end
    end
   
    enumeration
       Ip('ip', '%u')
       App('app', '%u')
       Device('device', '%u')
       Os('os','%u')
       Channel('channel','%u')
       ClickTime('click_time', '%{yyyy-MM-dd HH:mm:ss}D')
       AttributedTime('attributed_time', '%{yyyy-MM-dd HH:mm:ss}D')
       IsAttributed('is_attributed', '%u8')
    end
end

