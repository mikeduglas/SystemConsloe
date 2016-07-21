!!! TSystemConsole class, Clarion wrapper for .NET System.Console
!!! mikeduglas 2016
  MAP
    MODULE('SystemConsoleEx')
      sc::DebugInfo(STRING s)
    END
  END

  INCLUDE('SystemConsole.inc'), ONCE

ConsoleColorEnum              EQUATE(LONG)
ConsoleColor::Black           EQUATE(0)
ConsoleColor::DarkBlue        EQUATE(1)
ConsoleColor::DarkGreen       EQUATE(2)
ConsoleColor::DarkCyan        EQUATE(3)
ConsoleColor::DarkRed         EQUATE(4)
ConsoleColor::DarkMagenta     EQUATE(5)
ConsoleColor::DarkYellow      EQUATE(6)
ConsoleColor::Gray            EQUATE(7)
ConsoleColor::DarkGray        EQUATE(8)
ConsoleColor::Blue            EQUATE(9)
ConsoleColor::Green           EQUATE(10)
ConsoleColor::Cyan            EQUATE(11)
ConsoleColor::Red             EQUATE(12)
ConsoleColor::Magenta         EQUATE(13)
ConsoleColor::Yellow          EQUATE(14)
ConsoleColor::White           EQUATE(15)


TSystemConsole                CLASS(ISystemConsoleClass), TYPE, MODULE('SystemConsoleEx.clw'), LINK('SystemConsoleEx.clw')
m_COMIniter                     &CCOMIniter, PRIVATE

Construct                       PROCEDURE()
Destruct                        PROCEDURE(), DERIVED
Init                            PROCEDURE(), HRESULT, PROC, DERIVED
Kill                            PROCEDURE(), HRESULT, PROC, DERIVED

!!! <summary>
!!! Opens console window.
!!! </summary>
Open                            PROCEDURE()
!!! <summary>
!!! Closes console window.
!!! </summary>
Close                           PROCEDURE()
!!! <summary>
!!! Gets or sets the background color of the console.
!!! </summary>
BackgroundColor                 PROCEDURE(), ConsoleColorEnum
!!! <summary>
!!! Gets or sets the background color of the console.
!!! </summary>
BackgroundColor                 PROCEDURE(ConsoleColorEnum pColor)
!!! <summary>
!!! Gets or sets the foreground color of the console.
!!! </summary>
ForegroundColor                 PROCEDURE(), ConsoleColorEnum
!!! <summary>
!!! Gets or sets the foreground color of the console.
!!! </summary>
ForegroundColor                 PROCEDURE(ConsoleColorEnum pColor)
!!! <summary>
!!! Gets or sets the height of the buffer area, in rows.
!!! </summary>
BufferHeight                    PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the height of the buffer area, in rows.
!!! </summary>
BufferHeight                    PROCEDURE(LONG pHeight)
!!! <summary>
!!! Gets or sets the width of the buffer area, in columns.
!!! </summary>
BufferWidth                     PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the width of the buffer area, in columns.
!!! </summary>
BufferWidth                     PROCEDURE(LONG pWidth)
!!! <summary>
!!! Gets a value indicating whether the NUM LOCK keyboard toggle is turned on or turned off. 
!!! </summary>
NumberLock                      PROCEDURE(), BOOL
!!! <summary>
!!! Gets a value indicating whether the CAPS LOCK keyboard toggle is turned on or turned off. 
!!! </summary>
CapsLock                        PROCEDURE(), BOOL
!!! <summary>
!!! Gets or sets the column position of the cursor within the buffer area. 
!!! </summary>
CursorLeft                      PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the column position of the cursor within the buffer area. 
!!! </summary>
CursorLeft                      PROCEDURE(LONG pColumn)
!!! <summary>
!!! Gets or sets the row position of the cursor within the buffer area. 
!!! </summary>
CursorTop                       PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the row position of the cursor within the buffer area. 
!!! </summary>
CursorTop                       PROCEDURE(LONG pRow)
!!! <summary>
!!! Gets or sets the height of the cursor within a character cell (The size of the cursor expressed as a percentage of the height of a character cell. The property value ranges from 1 to 100).
!!! </summary>
CursorSize                      PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the height of the cursor within a character cell (The size of the cursor expressed as a percentage of the height of a character cell. The property value ranges from 1 to 100).
!!! </summary>
CursorSize                      PROCEDURE(LONG pSize)
!!! <summary>
!!! Gets or sets a value indicating whether the cursor is visible. 
!!! </summary>
CursorVisible                   PROCEDURE(), BOOL
!!! <summary>
!!! Gets or sets a value indicating whether the cursor is visible. 
!!! </summary>
CursorVisible                   PROCEDURE(BOOL pVisible)
!!! <summary>
!!! Gets or sets the encoding the console uses to read input. 
!!! </summary>
InputEncoding                   PROCEDURE(), STRING
!!! <summary>
!!! Gets or sets the encoding the console uses to read input. 
!!! </summary>
InputEncoding                   PROCEDURE(STRING pEncName)
!!! <summary>
!!! Gets or sets the encoding the console uses to write output. 
!!! </summary>
OutputEncoding                  PROCEDURE(), STRING
!!! <summary>
!!! Gets or sets the encoding the console uses to write output. 
!!! </summary>
OutputEncoding                  PROCEDURE(STRING pEncName)
!!! <summary>
!!! Gets a value indicating whether a key press is available in the input stream. 
!!! </summary>
KeyAvailable                    PROCEDURE(), BOOL
!!! <summary>
!!! Gets the largest possible number of console window rows, based on the current font and screen resolution. 
!!! </summary>
LargestWindowHeight             PROCEDURE(), LONG
!!! <summary>
!!! Gets the largest possible number of console window columns, based on the current font and screen resolution. 
!!! </summary>
LargestWindowWidth              PROCEDURE(), LONG
!!! <summary>
!!! Gets or sets the title to display in the console title bar. 
!!! </summary>
Title                           PROCEDURE(), STRING
!!! <summary>
!!! Gets or sets the title to display in the console title bar. 
!!! </summary>
Title                           PROCEDURE(STRING pTitle)
!!! <summary>
!!! Gets or sets a value indicating whether the combination of the Control modifier key and C console key (CTRL+C) is treated as ordinary input or as an interruption that is handled by the operating system. 
!!! </summary>
TreatControlCAsInput            PROCEDURE(), BOOL
!!! <summary>
!!! Gets or sets a value indicating whether the combination of the Control modifier key and C console key (CTRL+C) is treated as ordinary input or as an interruption that is handled by the operating system. 
!!! </summary>
TreatControlCAsInput            PROCEDURE(BOOL pCtrlCAsInput)
!!! <summary>
!!! The leftmost console window position measured in columns. 
!!! </summary>
WindowLeft                      PROCEDURE(), LONG
!!! <summary>
!!! The leftmost console window position measured in columns. 
!!! </summary>
WindowLeft                      PROCEDURE(LONG pPos)
!!! <summary>
!!! The uppermost console window position measured in rows. 
!!! </summary>
WindowTop                       PROCEDURE(), LONG
!!! <summary>
!!! The uppermost console window position measured in rows. 
!!! </summary>
WindowTop                       PROCEDURE(LONG pPos)
!!! <summary>
!!! The height of the console window measured in rows. 
!!! </summary>
WindowHeight                    PROCEDURE(), LONG
!!! <summary>
!!! The height of the console window measured in rows. 
!!! </summary>
WindowHeight                    PROCEDURE(LONG pRows)
!!! <summary>
!!! The width of the console window measured in columns. 
!!! </summary>
WindowWidth                     PROCEDURE(), LONG
!!! <summary>
!!! The width of the console window measured in columns. 
!!! </summary>
WindowWidth                     PROCEDURE(LONG pColumns)
!!! <summary>
!!! Plays the sound of a beep of a specified frequency and duration through the console speaker. 
!!! </summary>
!!! <param name="frequency">The frequency of the beep, ranging from 37 to 32767 hertz.</param>
!!! <param name="duration">The duration of the beep measured in milliseconds.</param>
!!! <remarks>By default, the beep plays at a frequency of 800 hertz for a duration of 200 milliseconds.</remarks>
Beep                            PROCEDURE(LONG frequency = 0, LONG duration = 0)
!!! <summary>
!!! Clears the console buffer and corresponding console window of display information.
!!! </summary>
ClearAll                        PROCEDURE()
!!! <summary>
!!! Copies a specified source area of the screen buffer to a specified destination area. 
!!! </summary>
!!! <param name="sourceLeft">The leftmost column of the source area.</param>
!!! <param name="sourceTop">The topmost row of the source area.</param>
!!! <param name="sourceWidth">The number of columns in the source area.</param>
!!! <param name="sourceHeight">The number of rows in the source area.</param>
!!! <param name="targetLeft">The leftmost column of the destination area.</param>
!!! <param name="targetTop">The topmost row of the destination area.</param>
!!! <param name="sourceChar">The character used to fill the source area.</param>
!!! <param name="sourceForeColor">The foreground color used to fill the source area.</param>
!!! <param name="sourceBackColor">The background color used to fill the source area.</param>
MoveBufferArea                  PROCEDURE(LONG sourceLeft, LONG sourceTop, LONG sourceWidth, LONG sourceHeight, LONG targetLeft, LONG targetTop, USHORT sourceChar = 0, LONG sourceForeColor = 0, LONG sourceBackColor = 0)
!!! <summary>
!!! The next character from the input stream, or negative one (-1) if there are currently no more characters to be read.
!!! </summary>
!!! <returns></returns>
Read                            PROCEDURE(), LONG, PROC
!!! <summary>
!!! Obtains the next character or function key pressed by the user. The pressed key is optionally displayed in the console window.
!!! </summary>
!!! <param name="intercept">Determines whether to display the pressed key in the console window. true to not display the pressed key; otherwise, false.</param>
!!! <param name="keyinfo">A ConsoleKeyInfo object that describes the ConsoleKey constant and Unicode character, if any, that correspond to the pressed console key. The ConsoleKeyInfo object also describes, in a bitwise combination of ConsoleModifiers values, whether one or more SHIFT, ALT, or CTRL modifier keys was pressed simultaneously with the console key.</param>
ReadKey                         PROCEDURE(*_ConsoleKeyInfoGrp keyinfo, BOOL pIntercept = FALSE)
!!! <summary>
!!! Obtains the next character or function key pressed by the user. The pressed key is optionally displayed in the console window.
!!! </summary>
!!! <param name="intercept">Determines whether to display the pressed key in the console window. true to not display the pressed key; otherwise, false.</param>
!!! <param name="keyinfo">A ConsoleKeyInfo object that describes the ConsoleKey constant and Unicode character, if any, that correspond to the pressed console key. The ConsoleKeyInfo object also describes, in a bitwise combination of ConsoleModifiers values, whether one or more SHIFT, ALT, or CTRL modifier keys was pressed simultaneously with the console key.</param>
ReadKey                         PROCEDURE()
!!! <summary>
!!! Reads the next line of characters from the standard input stream.
!!! </summary>
!!! <returns></returns>
ReadLine                        PROCEDURE(), STRING, PROC
!!! <summary>
!!! Sets the foreground and background console colors to their defaults.
!!! </summary>
ResetColor                      PROCEDURE()
!!! <summary>
!!! Sets the height and width of the screen buffer area to the specified values.
!!! </summary>
!!! <param name="width">The width of the buffer area measured in columns.</param>
!!! <param name="height">The height of the buffer area measured in rows.</param>
SetBufferSize                   PROCEDURE(LONG pWidth, LONG pHeight)
!!! <summary>
!!! Sets the position of the cursor.
!!! </summary>
!!! <param name="left">The column position of the cursor.</param>
!!! <param name="top">The row position of the cursor.</param>
SetCursorPosition               PROCEDURE(LONG pLeft, LONG pTop)
!!! <summary>
!!! Sets the position of the console window relative to the screen buffer.
!!! </summary>
!!! <param name="left">The column position of the upper left corner of the console window.</param>
!!! <param name="top">The row position of the upper left corner of the console window.</param>
SetWindowPosition               PROCEDURE(LONG pLeft, LONG pTop)
!!! <summary>
!!! Sets the height and width of the console window to the specified values.
!!! </summary>
!!! <param name="width">The width of the console window measured in columns.</param>
!!! <param name="height">The height of the console window measured in rows</param>
SetWindowSize                   PROCEDURE(LONG pWidth, LONG pHeight)
!!! <summary>
!!! Writes the specified string value to the standard output stream.
!!! </summary>
!!! <param name="value">The value to write.</param>
Write                           PROCEDURE(STRING pValue, BOOL pDoClip = TRUE)
!!! <summary>
!!! Writes the specified string value, followed by the current line terminator, to the standard output stream.
!!! </summary>
!!! <param name="value">The value to write.</param>
WriteLine                       PROCEDURE(<STRING pValue>)
                              END
