class Screen
  def action text
    puts text
  end
end

class LogFile
  def action text
    IO.write("log.log", text)
  end
end

class MessageQueue
  def action text
    Queue.put text
  end
end

class JsonEndpoint
  def action text
    HTTP.post(text)
  end
end

class LogTash
  def action text
    Logtash.add text
  end
end

class LogWatch
  def action text
    Logwatch.add text
  end
end

class Printer
  def initialize ouptut
    @output = output
  end

  def print_msg text
    @output.action text
  end
end

printer = Printer.new Screen.new
printer.print_msg "Hello world"
