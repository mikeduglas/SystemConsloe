  MEMBER
  INCLUDE('svcom.inc'), ONCE
  MAP
    INCLUDE('svapifnc.inc'), ONCE
    MODULE('winapi')
      OutputDebugString(*CSTRING lpOutputString), PASCAL, RAW, NAME('OutputDebugStringA')
    END
  END
  INCLUDE('SystemConsoleEx.inc'), ONCE

sc::DebugInfo                 PROCEDURE(STRING s)
pfx                             STRING('[SystemConsole] ')
cs                              CSTRING(LEN(s) + LEN(pfx) + 1)
  CODE
  cs = pfx & s
  OutputDebugString(cs)

!!!region TSystemConsole
TSystemConsole.Construct      PROCEDURE()
  CODE
  SELF.m_COMIniter &= NEW CCOMIniter

TSystemConsole.Destruct       PROCEDURE()
  CODE
  PARENT.Destruct()
  DISPOSE(SELF.m_COMIniter)

TSystemConsole.Init           PROCEDURE()
hr                              HRESULT, AUTO

  CODE
  hr = PARENT.Init()
  IF hr <> S_OK
    sc::DebugInfo('PARENT.Init error '& SELF.Dec2Hex(hr))
    RETURN hr
  END

  RETURN S_OK
  
TSystemConsole.Kill           PROCEDURE()
  CODE
  RETURN PARENT.Kill()
  
TSystemConsole.Open           PROCEDURE()
  CODE
  PARENT.vOpen()
  
TSystemConsole.Close          PROCEDURE()
  CODE
  PARENT.vClose()

TSystemConsole.BackgroundColor    PROCEDURE()  !, ConsoleColorEnum
lRetVal                             LONG, AUTO
  CODE
  PARENT.GetBackgroundColor(lRetVal)
  RETURN lRetVal
  
TSystemConsole.BackgroundColor    PROCEDURE(ConsoleColorEnum pColor)
  CODE
  PARENT.SetBackgroundColor(pColor)
  
TSystemConsole.ForegroundColor    PROCEDURE()  !, ConsoleColorEnum
lRetVal                             LONG, AUTO
  CODE
  PARENT.GetForegroundColor(lRetVal)
  RETURN lRetVal
  
TSystemConsole.ForegroundColor    PROCEDURE(ConsoleColorEnum pColor)
  CODE
  PARENT.SetForegroundColor(pColor)
  
TSystemConsole.BufferHeight   PROCEDURE() !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetBufferHeight(lRetVal)
  RETURN lRetVal

TSystemConsole.BufferHeight   PROCEDURE(LONG pHeight)
  CODE
  PARENT.SetBufferHeight(pHeight)
  
TSystemConsole.BufferWidth    PROCEDURE() !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetBufferWidth(lRetVal)
  RETURN lRetVal

TSystemConsole.BufferWidth    PROCEDURE(LONG pWidth)
  CODE
  PARENT.SetBufferWidth(pWidth)

TSystemConsole.NumberLock     PROCEDURE()  !, BOOL
lRetVal                         VARIANT_BOOL, AUTO
  CODE
  PARENT.vNumberLock(lRetVal)
  RETURN CHOOSE(lRetVal = VARIANT_TRUE)
  
TSystemConsole.CapsLock       PROCEDURE()  !, BOOL
lRetVal                         VARIANT_BOOL, AUTO
  CODE
  PARENT.vCapsLock(lRetVal)
  RETURN CHOOSE(lRetVal = VARIANT_TRUE)

TSystemConsole.CursorLeft     PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetCursorLeft(lRetVal)
  RETURN lRetVal

TSystemConsole.CursorLeft     PROCEDURE(LONG pColumn)
  CODE
  PARENT.SetCursorLeft(pColumn)
  
TSystemConsole.CursorTop      PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetCursorTop(lRetVal)
  RETURN lRetVal

TSystemConsole.CursorTop      PROCEDURE(LONG pRow)
  CODE
  PARENT.SetCursorTop(pRow)
  
TSystemConsole.CursorSize     PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetCursorSize(lRetVal)
  RETURN lRetVal

TSystemConsole.CursorSize     PROCEDURE(LONG pSize)
  CODE
  PARENT.SetCursorSize(pSize)
  
TSystemConsole.CursorVisible  PROCEDURE()  !, BOOL
lRetVal                         VARIANT_BOOL, AUTO
  CODE
  PARENT.GetCursorVisible(lRetVal)
  RETURN CHOOSE(lRetVal = VARIANT_TRUE)
  
TSystemConsole.CursorVisible  PROCEDURE(BOOL pVisible)
  CODE
  PARENT.SetCursorVisible(CHOOSE(pVisible = TRUE, VARIANT_TRUE, VARIANT_FALSE))
  
TSystemConsole.InputEncoding  PROCEDURE()  !, STRING
lRetVal                         BSTRING
  CODE
  PARENT.GetInputEncoding(lRetVal)
  RETURN lRetVal

TSystemConsole.InputEncoding  PROCEDURE(STRING pEncName)
  CODE
  PARENT.SetInputEncoding(CLIP(pEncName))
  
TSystemConsole.OutputEncoding PROCEDURE()  !, STRING
lRetVal                         BSTRING
  CODE
  PARENT.GetOutputEncoding(lRetVal)
  RETURN lRetVal

TSystemConsole.OutputEncoding PROCEDURE(STRING pEncName)
  CODE
  PARENT.SetOutputEncoding(CLIP(pEncName))
  
TSystemConsole.KeyAvailable   PROCEDURE()  !, BOOL
lRetVal                         VARIANT_BOOL, AUTO
  CODE
  PARENT.vKeyAvailable(lRetVal)
  RETURN CHOOSE(lRetVal = VARIANT_TRUE)
  
TSystemConsole.LargestWindowHeight    PROCEDURE()  !, LONG
lRetVal                                 LONG, AUTO
  CODE
  PARENT.vLargestWindowHeight(lRetVal)
  RETURN lRetVal

TSystemConsole.LargestWindowWidth PROCEDURE()  !, LONG
lRetVal                             LONG, AUTO
  CODE
  PARENT.vLargestWindowWidth(lRetVal)
  RETURN lRetVal

TSystemConsole.Title          PROCEDURE()  !, STRING
lRetVal                         BSTRING
  CODE
  PARENT.GetTitle(lRetVal)
  RETURN lRetVal

TSystemConsole.Title          PROCEDURE(STRING pTitle)
  CODE
  PARENT.SetTitle(CLIP(pTitle))
  
TSystemConsole.TreatControlCAsInput   PROCEDURE()  !, BOOL
lRetVal                                 VARIANT_BOOL, AUTO
  CODE
  PARENT.GetTreatControlCAsInput(lRetVal)
  RETURN CHOOSE(lRetVal = VARIANT_TRUE)
  
TSystemConsole.TreatControlCAsInput   PROCEDURE(BOOL pCtrlCAsInput)
  CODE
  PARENT.SetTreatControlCAsInput(CHOOSE(pCtrlCAsInput = TRUE, VARIANT_TRUE, VARIANT_FALSE))
  
TSystemConsole.WindowLeft     PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetWindowLeft(lRetVal)
  RETURN lRetVal

TSystemConsole.WindowLeft     PROCEDURE(LONG pPos)
  CODE
  PARENT.SetWindowLeft(pPos)
  
TSystemConsole.WindowTop      PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetWindowTop(lRetVal)
  RETURN lRetVal

TSystemConsole.WindowTop      PROCEDURE(LONG pPos)
  CODE
  PARENT.SetWindowTop(pPos)
  
TSystemConsole.WindowHeight   PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetWindowHeight(lRetVal)
  RETURN lRetVal

TSystemConsole.WindowHeight   PROCEDURE(LONG pRows)
  CODE
  PARENT.SetWindowHeight(pRows)
  
TSystemConsole.WindowWidth    PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.GetWindowWidth(lRetVal)
  RETURN lRetVal

TSystemConsole.WindowWidth    PROCEDURE(LONG pColumns)
  CODE
  PARENT.SetWindowWidth(pColumns)
  
TSystemConsole.Beep           PROCEDURE(LONG frequency = 0, LONG duration = 0)
  CODE
  PARENT.vBeep(frequency, duration)
  
TSystemConsole.ClearAll       PROCEDURE()
  CODE
  PARENT.vClear()
  
TSystemConsole.MoveBufferArea PROCEDURE(LONG sourceLeft, LONG sourceTop, LONG sourceWidth, LONG sourceHeight, LONG targetLeft, LONG targetTop, USHORT sourceChar = 0, LONG sourceForeColor = 0, LONG sourceBackColor = 0)
  CODE
  PARENT.vMoveBufferArea(sourceLeft, sourceTop, sourceWidth, sourceHeight, targetLeft, targetTop, sourceChar, sourceForeColor, sourceBackColor)
  
TSystemConsole.Read           PROCEDURE()  !, LONG
lRetVal                         LONG, AUTO
  CODE
  PARENT.vRead(lRetVal)
  RETURN lRetVal

TSystemConsole.ReadKey        PROCEDURE(*_ConsoleKeyInfoGrp keyinfo, BOOL pIntercept = FALSE)
  CODE
  PARENT.vReadKey(CHOOSE(pIntercept = TRUE, VARIANT_TRUE, VARIANT_FALSE), keyinfo)
  
TSystemConsole.ReadKey        PROCEDURE()
cki                             LIKE(_ConsoleKeyInfoGrp)
  CODE
  SELF.ReadKey(cki, TRUE)

TSystemConsole.ReadLine       PROCEDURE()  !, STRING
lRetVal                         BSTRING
  CODE
  PARENT.vReadLine(lRetVal)
  RETURN lRetVal
  
TSystemConsole.ResetColor     PROCEDURE()
  CODE
  PARENT.vResetColor()
  
TSystemConsole.SetBufferSize  PROCEDURE(LONG pWidth, LONG pHeight)
  CODE
  PARENT.vSetBufferSize(pWidth, pHeight)
  
TSystemConsole.SetCursorPosition  PROCEDURE(LONG pLeft, LONG pTop)
  CODE
  PARENT.vSetCursorPosition(pLeft, pTop)
  
TSystemConsole.SetWindowPosition  PROCEDURE(LONG pLeft, LONG pTop)
  CODE
  PARENT.vSetWindowPosition(pLeft, pTop)
  
TSystemConsole.SetWindowSize  PROCEDURE(LONG pWidth, LONG pHeight)
  CODE
  PARENT.vSetWindowSize(pWidth, pHeight)
  
TSystemConsole.Write          PROCEDURE(STRING pValue, BOOL pDoClip = TRUE)
  CODE
  PARENT.vWrite(CHOOSE(pDoClip = TRUE, CLIP(pValue), pValue))
  
TSystemConsole.WriteLine      PROCEDURE(<STRING pValue>)
  CODE
  PARENT.vWriteLine(CLIP(pValue))
