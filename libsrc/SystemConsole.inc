!Generated .INC file (by the Easy COM generator v 1.14)

  INCLUDE('ecom2inc.def'),ONCE
  INCLUDE('SystemConsole.int'),ONCE
  INCLUDE('ecombase.inc'),ONCE

ISystemConsoleClass           CLASS(EasyCOMClass),TYPE,MODULE('SystemConsole.clw'),LINK('SystemConsole.clw')
ISystemConsoleObj               &ISystemConsole,PROTECTED
Construct                       PROCEDURE()
Destruct                        PROCEDURE(),DERIVED
Init                            PROCEDURE(),HRESULT,PROC,DERIVED
Init                            PROCEDURE(LONG lpInterface),HRESULT,PROC,DERIVED
Kill                            PROCEDURE(),HRESULT,PROC,DERIVED
GetInterfaceObject              PROCEDURE(),*ISystemConsole
GetInterfaceAddr                PROCEDURE(),LONG
GetLibLocation                  PROCEDURE(),STRING,DERIVED
!Interface methods
vOpen                           PROCEDURE(),HRESULT,PROC,VIRTUAL,PROTECTED
vClose                          PROCEDURE(),HRESULT,PROC,VIRTUAL,PROTECTED
GetBackgroundColor              PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetBackgroundColor              PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetForegroundColor              PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetForegroundColor              PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetBufferHeight                 PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetBufferHeight                 PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetBufferWidth                  PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetBufferWidth                  PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vNumberLock                     PROCEDURE(*VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vCapsLock                       PROCEDURE(*VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetCursorLeft                   PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetCursorLeft                   PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetCursorTop                    PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetCursorTop                    PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetCursorSize                   PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetCursorSize                   PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetCursorVisible                PROCEDURE(*VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetCursorVisible                PROCEDURE(VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetInputEncoding                PROCEDURE(*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetInputEncoding                PROCEDURE(BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetOutputEncoding               PROCEDURE(*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetOutputEncoding               PROCEDURE(BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vKeyAvailable                   PROCEDURE(*VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vLargestWindowHeight            PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vLargestWindowWidth             PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetTitle                        PROCEDURE(*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetTitle                        PROCEDURE(BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetTreatControlCAsInput         PROCEDURE(*VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetTreatControlCAsInput         PROCEDURE(VARIANT_BOOL pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetWindowLeft                   PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetWindowLeft                   PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetWindowTop                    PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetWindowTop                    PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetWindowHeight                 PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetWindowHeight                 PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
GetWindowWidth                  PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
SetWindowWidth                  PROCEDURE(long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vBeep                           PROCEDURE(long frequency,long duration),HRESULT,PROC,VIRTUAL,PROTECTED
vClear                          PROCEDURE(),HRESULT,PROC,VIRTUAL,PROTECTED
vMoveBufferArea                 PROCEDURE(long sourceLeft,long sourceTop,long sourceWidth,long sourceHeight,long targetLeft,  |
                                long targetTop,USHORT sourceChar,long sourceForeColor,long sourceBackColor),HRESULT,PROC,VIRTUAL,PROTECTED
vRead                           PROCEDURE(*long pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vReadKey                        PROCEDURE(VARIANT_BOOL intercept,*_ConsoleKeyInfoGrp keyinfo),HRESULT,PROC,VIRTUAL,PROTECTED
vReadLine                       PROCEDURE(*BSTRING pRetVal),HRESULT,PROC,VIRTUAL,PROTECTED
vResetColor                     PROCEDURE(),HRESULT,PROC,VIRTUAL,PROTECTED
vSetBufferSize                  PROCEDURE(long width,long height),HRESULT,PROC,VIRTUAL,PROTECTED
vSetCursorPosition              PROCEDURE(long left,long top),HRESULT,PROC,VIRTUAL,PROTECTED
vSetWindowPosition              PROCEDURE(long left,long top),HRESULT,PROC,VIRTUAL,PROTECTED
vSetWindowSize                  PROCEDURE(long width,long height),HRESULT,PROC,VIRTUAL,PROTECTED
vWrite                          PROCEDURE(BSTRING value),HRESULT,PROC,VIRTUAL,PROTECTED
vWriteLine                      PROCEDURE(BSTRING value),HRESULT,PROC,VIRTUAL,PROTECTED
                              END

