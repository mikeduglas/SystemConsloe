  PROGRAM

  PRAGMA('project(#pragma define(_SVDllMode_ => 0))')
  PRAGMA('project(#pragma define(_SVLinkMode_ => 1))')
  !- link manifest
  PRAGMA('project(#pragma link(ConsoleDemo.EXE.manifest))')

  INCLUDE('SystemConsoleEx.inc'), ONCE

  MAP
  END

console                       TSystemConsole
cki                           GROUP(_ConsoleKeyInfoGrp)
                              END
cmd                           ANY
  
  CODE
  IF console.Init() <> S_OK
    HALT()
  END
  
  console.Open()
  
  console.Title('Console demo')
  
  console.ForegroundColor(ConsoleColor::White)
  console.WriteLine('Console demo')
  console.WriteLine()

  DO Usage
  
  LOOP
    console.ResetColor()
    console.Write('> ', FALSE)
    
    console.ReadKey(cki, TRUE)
    CASE UPPER(CHR(cki.KeyChar))
    OF 'R'
      console.Write('Enter DOS command: ', FALSE)
      cmd = console.ReadLine()
      RUN('cmd /c '& cmd, 1)
    OF 'H'
      DO Help
    OF 'C'
      console.ForegroundColor(ConsoleColor::Yellow)
      LOOP 5 TIMES
        console.Write('.')
        console.Beep(440, 500)
      END
      console.WriteLine(' busy, try again later!')
    OF 'E'
      console.ClearAll()
      DO Usage
    OF 'U'
      DO Usage
    OF 'Q' OROF 'X'
      console.ResetColor()
      console.WriteLine('Press any key to quit...')
      console.ReadKey()
      BREAK
    ELSE
      console.ForegroundColor(ConsoleColor::Red)
      console.WriteLine('Unknown command '& CHR(cki.KeyChar))
      DO Usage
    END
  END

  console.Close()
  console.Kill()
  
Usage                         ROUTINE
  console.ForegroundColor(ConsoleColor::Green)
  console.WriteLine('Usage:')
  console.WriteLine('H = Help')
  console.WriteLine('U = Usage')
  console.WriteLine('R = Run DOS command')
  console.WriteLine('E = Erase screen')
  console.WriteLine('C = Call me!')
  console.WriteLine('Q = Quit')

Help                          ROUTINE
  console.ForegroundColor(ConsoleColor::DarkCyan)
  console.WriteLine('TSystemConsole class represents the standard input, output, and error streams for console applications. ' &|
  'The console is an operating system window where users interact with the operating system ' &|
  'or a text-based console application by entering text input through the computer keyboard, ' &|
  'and reading text output from the computer terminal. ' &|
  'For example, in Windows the console is called the command prompt window and accepts MS-DOS commands. ' &|
  'The TSystemConsole class provides basic support for applications that read characters from, and write characters to, the console.')
  
  console.ForegroundColor(ConsoleColor::White)
  console.WriteLine('See SystemConsoleEx.inc to get more help.')
