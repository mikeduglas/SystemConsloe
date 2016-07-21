!Generated .CLW file (by the Easy COM generator v 1.14)

  MEMBER
  INCLUDE('svcomdef.inc'),ONCE
  MAP
    MODULE('WinAPI')
      ecg_DispGetParam(LONG pdispparams,LONG dwPosition,VARTYPE vtTarg,*VARIANT pvarResult,*SIGNED uArgErr),HRESULT,RAW,PASCAL,NAME('DispGetParam')
      ecg_VariantInit(*VARIANT pvarg),HRESULT,PASCAL,PROC,NAME('VariantInit')
      ecg_VariantClear(*VARIANT pvarg),HRESULT,PASCAL,PROC,NAME('VariantClear')
      ecg_VariantCopy(*VARIANT vargDest,*VARIANT vargSrc),HRESULT,PASCAL,PROC,NAME('VariantCopy')
      memcpy(LONG lpDest,LONG lpSource,LONG nCount),LONG,PROC,NAME('_memcpy')
      GetErrorInfo(ULONG dwReserved,LONG pperrinfo),HRESULT,PASCAL,PROC
    END
    INCLUDE('svapifnc.inc')
    Dec2Hex(ULONG),STRING
    INCLUDE('getvartype.inc', 'DECLARATIONS')
  END
  INCLUDE('SystemConsole.inc')

Dec2Hex                       PROCEDURE(ULONG pDec)
locHex                          STRING(30)
  CODE
  LOOP UNTIL(~pDec)
    locHex = SUB('0123456789ABCDEF',1+pDec % 16,1) & CLIP(locHex)
    pDec = INT(pDec / 16)
  END
  RETURN CLIP(locHex)

  INCLUDE('getvartype.inc', 'CODE')
!========================================================!
! ISystemConsoleClass implementation                     !
!========================================================!
ISystemConsoleClass.Construct PROCEDURE()
  CODE
  SELF.debug=true

ISystemConsoleClass.Destruct  PROCEDURE()
  CODE
  IF SELF.IsInitialized=true THEN SELF.Kill() END

ISystemConsoleClass.Init      PROCEDURE()
loc:lpInterface                 LONG
  CODE
  SELF.HR=CoCreateInstance(ADDRESS(IID_SystemConsole),0,SELF.dwClsContext,ADDRESS(IID_ISystemConsole),loc:lpInterface)
  IF SELF.HR=S_OK
    RETURN SELF.Init(loc:lpInterface)
  ELSE
    SELF.IsInitialized=false
    SELF._ShowErrorMessage('ISystemConsoleClass.Init: CoCreateInstance',SELF.HR)
  END
  RETURN SELF.HR

ISystemConsoleClass.Init      PROCEDURE(LONG lpInterface)
  CODE
  IF PARENT.Init(lpInterface) = S_OK
    SELF.ISystemConsoleObj &= (lpInterface)
  END
  RETURN SELF.HR

ISystemConsoleClass.Kill      PROCEDURE()
  CODE
  IF PARENT.Kill() = S_OK
    SELF.ISystemConsoleObj &= NULL
  END
  RETURN SELF.HR

ISystemConsoleClass.GetInterfaceObject    PROCEDURE()
  CODE
  RETURN SELF.ISystemConsoleObj

ISystemConsoleClass.GetInterfaceAddr  PROCEDURE()
  CODE
  RETURN ADDRESS(SELF.ISystemConsoleObj)
  !RETURN INSTANCE(SELF.ISystemConsoleObj, 0)

ISystemConsoleClass.GetLibLocation    PROCEDURE()
  CODE
  RETURN GETREG(REG_CLASSES_ROOT,'CLSID\{{3D33C2A1-9CC3-4CDA-BB73-EBC47E49DCD7}\InprocServer32')

ISystemConsoleClass.vOpen     PROCEDURE()
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.Open()
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Open',HR)
  END
  RETURN HR

ISystemConsoleClass.vClose    PROCEDURE()
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.Close()
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Close',HR)
  END
  RETURN HR

ISystemConsoleClass.GetBackgroundColor    PROCEDURE(*long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetBackgroundColor(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetBackgroundColor',HR)
  END
  RETURN HR

ISystemConsoleClass.SetBackgroundColor    PROCEDURE(long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetBackgroundColor(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetBackgroundColor',HR)
  END
  RETURN HR

ISystemConsoleClass.GetForegroundColor    PROCEDURE(*long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetForegroundColor(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetForegroundColor',HR)
  END
  RETURN HR

ISystemConsoleClass.SetForegroundColor    PROCEDURE(long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetForegroundColor(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetForegroundColor',HR)
  END
  RETURN HR

ISystemConsoleClass.GetBufferHeight   PROCEDURE(*long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetBufferHeight(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetBufferHeight',HR)
  END
  RETURN HR

ISystemConsoleClass.SetBufferHeight   PROCEDURE(long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetBufferHeight(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetBufferHeight',HR)
  END
  RETURN HR

ISystemConsoleClass.GetBufferWidth    PROCEDURE(*long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetBufferWidth(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetBufferWidth',HR)
  END
  RETURN HR

ISystemConsoleClass.SetBufferWidth    PROCEDURE(long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetBufferWidth(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetBufferWidth',HR)
  END
  RETURN HR

ISystemConsoleClass.vNumberLock   PROCEDURE(*VARIANT_BOOL ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.NumberLock(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.NumberLock',HR)
  END
  RETURN HR

ISystemConsoleClass.vCapsLock PROCEDURE(*VARIANT_BOOL ppRetVal)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.CapsLock(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.CapsLock',HR)
  END
  RETURN HR

ISystemConsoleClass.GetCursorLeft PROCEDURE(*long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetCursorLeft(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetCursorLeft',HR)
  END
  RETURN HR

ISystemConsoleClass.SetCursorLeft PROCEDURE(long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetCursorLeft(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetCursorLeft',HR)
  END
  RETURN HR

ISystemConsoleClass.GetCursorTop  PROCEDURE(*long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetCursorTop(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetCursorTop',HR)
  END
  RETURN HR

ISystemConsoleClass.SetCursorTop  PROCEDURE(long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetCursorTop(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetCursorTop',HR)
  END
  RETURN HR

ISystemConsoleClass.GetCursorSize PROCEDURE(*long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetCursorSize(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetCursorSize',HR)
  END
  RETURN HR

ISystemConsoleClass.SetCursorSize PROCEDURE(long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetCursorSize(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetCursorSize',HR)
  END
  RETURN HR

ISystemConsoleClass.GetCursorVisible  PROCEDURE(*VARIANT_BOOL ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetCursorVisible(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetCursorVisible',HR)
  END
  RETURN HR

ISystemConsoleClass.SetCursorVisible  PROCEDURE(VARIANT_BOOL ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetCursorVisible(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetCursorVisible',HR)
  END
  RETURN HR

ISystemConsoleClass.GetInputEncoding  PROCEDURE(*BSTRING ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetInputEncoding(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetInputEncoding',HR)
  END
  RETURN HR

ISystemConsoleClass.SetInputEncoding  PROCEDURE(BSTRING ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetInputEncoding(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetInputEncoding',HR)
  END
  RETURN HR

ISystemConsoleClass.GetOutputEncoding PROCEDURE(*BSTRING ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetOutputEncoding(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetOutputEncoding',HR)
  END
  RETURN HR

ISystemConsoleClass.SetOutputEncoding PROCEDURE(BSTRING ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetOutputEncoding(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetOutputEncoding',HR)
  END
  RETURN HR

ISystemConsoleClass.vKeyAvailable PROCEDURE(*VARIANT_BOOL ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.KeyAvailable(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.KeyAvailable',HR)
  END
  RETURN HR

ISystemConsoleClass.vLargestWindowHeight  PROCEDURE(*long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.LargestWindowHeight(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.LargestWindowHeight',HR)
  END
  RETURN HR

ISystemConsoleClass.vLargestWindowWidth   PROCEDURE(*long ppRetVal)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.LargestWindowWidth(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.LargestWindowWidth',HR)
  END
  RETURN HR

ISystemConsoleClass.GetTitle  PROCEDURE(*BSTRING ppRetVal)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetTitle(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetTitle',HR)
  END
  RETURN HR

ISystemConsoleClass.SetTitle  PROCEDURE(BSTRING ppRetVal)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetTitle(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetTitle',HR)
  END
  RETURN HR

ISystemConsoleClass.GetTreatControlCAsInput   PROCEDURE(*VARIANT_BOOL ppRetVal)
HR                                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetTreatControlCAsInput(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetTreatControlCAsInput',HR)
  END
  RETURN HR

ISystemConsoleClass.SetTreatControlCAsInput   PROCEDURE(VARIANT_BOOL ppRetVal)
HR                                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetTreatControlCAsInput(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetTreatControlCAsInput',HR)
  END
  RETURN HR

ISystemConsoleClass.GetWindowLeft PROCEDURE(*long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetWindowLeft(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetWindowLeft',HR)
  END
  RETURN HR

ISystemConsoleClass.SetWindowLeft PROCEDURE(long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowLeft(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowLeft',HR)
  END
  RETURN HR

ISystemConsoleClass.GetWindowTop  PROCEDURE(*long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetWindowTop(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetWindowTop',HR)
  END
  RETURN HR

ISystemConsoleClass.SetWindowTop  PROCEDURE(long ppRetVal)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowTop(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowTop',HR)
  END
  RETURN HR

ISystemConsoleClass.GetWindowHeight   PROCEDURE(*long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetWindowHeight(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetWindowHeight',HR)
  END
  RETURN HR

ISystemConsoleClass.SetWindowHeight   PROCEDURE(long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowHeight(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowHeight',HR)
  END
  RETURN HR

ISystemConsoleClass.GetWindowWidth    PROCEDURE(*long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.GetWindowWidth(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.GetWindowWidth',HR)
  END
  RETURN HR

ISystemConsoleClass.SetWindowWidth    PROCEDURE(long ppRetVal)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowWidth(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowWidth',HR)
  END
  RETURN HR

ISystemConsoleClass.vBeep     PROCEDURE(long pfrequency,long pduration)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.Beep(pfrequency,pduration)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Beep',HR)
  END
  RETURN HR

ISystemConsoleClass.vClear    PROCEDURE()
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.CLEAR_COM()
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Clear',HR)
  END
  RETURN HR

ISystemConsoleClass.vMoveBufferArea   PROCEDURE(long psourceLeft,long psourceTop,long psourceWidth,long psourceHeight,long ptargetLeft,long ptargetTop,USHORT psourceChar,long psourceForeColor,long psourceBackColor)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.MoveBufferArea(psourceLeft,psourceTop,psourceWidth,psourceHeight,ptargetLeft,ptargetTop,psourceChar,psourceForeColor,psourceBackColor)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.MoveBufferArea',HR)
  END
  RETURN HR

ISystemConsoleClass.vRead     PROCEDURE(*long ppRetVal)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.Read(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Read',HR)
  END
  RETURN HR

ISystemConsoleClass.vReadKey  PROCEDURE(VARIANT_BOOL pintercept,*_ConsoleKeyInfoGrp pkeyinfo)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.ReadKey(pintercept,pkeyinfo)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.ReadKey',HR)
  END
  RETURN HR

ISystemConsoleClass.vReadLine PROCEDURE(*BSTRING ppRetVal)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.ReadLine(ppRetVal)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.ReadLine',HR)
  END
  RETURN HR

ISystemConsoleClass.vResetColor   PROCEDURE()
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.ResetColor()
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.ResetColor',HR)
  END
  RETURN HR

ISystemConsoleClass.vSetBufferSize    PROCEDURE(long pwidth,long pheight)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetBufferSize(pwidth,pheight)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetBufferSize',HR)
  END
  RETURN HR

ISystemConsoleClass.vSetCursorPosition    PROCEDURE(long pleft,long ptop)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetCursorPosition(pleft,ptop)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetCursorPosition',HR)
  END
  RETURN HR

ISystemConsoleClass.vSetWindowPosition    PROCEDURE(long pleft,long ptop)
HR                                          HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowPosition(pleft,ptop)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowPosition',HR)
  END
  RETURN HR

ISystemConsoleClass.vSetWindowSize    PROCEDURE(long pwidth,long pheight)
HR                                      HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.SetWindowSize(pwidth,pheight)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.SetWindowSize',HR)
  END
  RETURN HR

ISystemConsoleClass.vWrite    PROCEDURE(BSTRING pvalue)
HR                              HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.Write(pvalue)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.Write',HR)
  END
  RETURN HR

ISystemConsoleClass.vWriteLine    PROCEDURE(BSTRING pvalue)
HR                                  HRESULT(S_OK)

  CODE
  IF SELF.IsInitialized=false THEN SELF.HR=E_FAIL;RETURN(SELF.HR) END
  HR=SELF.ISystemConsoleObj.WriteLine(pvalue)
  SELF.HR=HR
  IF HR < S_OK
    SELF._ShowErrorMessage('ISystemConsoleClass.WriteLine',HR)
  END
  RETURN HR

