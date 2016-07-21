#TEMPLATE(SystemConsoleTpl,'SystemConsole API'), FAMILY('ABC'), FAMILY('CW20')
#! --------------------------------------------------------------------------
#INCLUDE('SVFnGrp.TPW')
#INCLUDE('ISPFnGrp.TPW')
#!
#EXTENSION(SystemConsoleGloExt,'Activate SystemConsole'), APPLICATION
#! --------------------------------------------------------------------------
#SHEET
  #TAB('About')
    #BOXED('SystemConsole support')
      #DISPLAY
      #BOXED('')
        #DISPLAY('SystemConsole               Version 1.00')
        #DISPLAY('')
        #DISPLAY('mikeduglas © 2016')
      #ENDBOXED
      #DISPLAY('')
      #ENABLE(%ProgramExtension = 'EXE'),CLEAR
        #PROMPT('Enable Registration-Free Activation ', CHECK),%scAddDependency,DEFAULT(1),AT(10)
        #PROMPT('Link manifest', CHECK),%scLinkManifest,DEFAULT(1),AT(10)
        #PROMPT('Copy DLL to output folder', CHECK),%scCopyToOutput,DEFAULT(1),AT(10)
      #ENDENABLE
    #ENDBOXED
    #DISPLAY
    #DISPLAY
    #BOXED, WHERE(%CWVersion < 7100), SECTION, AT(, 170)
      #DISPLAY('Check this off if you have link errors ''Duplicate symbols...''')
      #PROMPT('Link oleautcg.lib:',CHECK),%LinkOleAutcgC6,DEFAULT(1),AT(12)
    #ENDBOXED
    #BOXED, WHERE(%CWVersion >= 7100), SECTION, AT(, 170)
      #DISPLAY('Check this off if you have link errors ''Duplicate symbols...''')
      #PROMPT('Link oleautcg.lib:',CHECK),%LinkOleAutcgC7,DEFAULT(0),AT(12)
    #ENDBOXED
    #BOXED, HIDE
      #PROMPT('Link oleautcg.lib:',CHECK),%LinkOleAutcg,AT(12)
    #ENDBOXED
  #ENDTAB
  #TAB('Hidden'),WHERE(%False)
    #PROMPT('Template version:', @s10),%sciTPLVersion,DEFAULT('1.00')
    #PROMPT('Assembly name:', @s20), %scAssemblyName,DEFAULT('SystemConsole')
    #PROMPT('Assembly version:', @s16),%scAssemblyVersion,DEFAULT('1.0.0.0')
  #ENDTAB
#ENDSHEET
#! --------------------------------------------------------------------------
#AT(%BeforeGenerateApplication)
  #pdefine('_SVDllMode_',0)
  #pdefine('_SVLinkMode_',1)
  #IF(%CWVersion < 7100)
    #SET(%LinkOleAutcg, %LinkOleAutcgC6)
  #ELSE
    #SET(%LinkOleAutcg, %LinkOleAutcgC7)
  #ENDIF
  #pdefine('_ecgOleAutLinkMode_',%LinkOleAutcg)
#ENDAT
#! --------------------------------------------------------------------------
#AT(%BeforeGenerateApplication)
  #pdefine('_ABCDllMode_',0)
  #pdefine('_ABCLinkMode_',1)
#ENDAT
#! --------------------------------------------------------------------------
#AT(%AfterGeneratedApplication)
  #IF(%scAddDependency = '1')
    #SET(%scAssemblyVersion, '1.0.0.0')
    #CALL(%AddDependency, %scAssemblyName, %scAssemblyVersion, %scLinkManifest)
  #ENDIF
#ENDAT
#! --------------------------------------------------------------------------
#AT(%AfterGlobalIncludes)
  #IF(%AppTemplateFamily='ABC')
    #ADD(%GlobalIncludeList,'SystemConsoleEx.inc')
  #ELSE
    #ADD(%CustomGlobalDeclarationIncludes,'SystemConsoleEx.inc')
  #ENDIF
#ENDAT
#! --------------------------------------------------------------------------
#AT(%CustomGlobalDeclarations)
  #IF(%CWVersion >= 8000)
    #IF(%scCopyToOutput='1')
      #PROJECT('None(SystemConsole.dll), CopyToOutputDirectory=Always')
    #ELSE  
      #PROJECT('None(SystemConsole.dll), CopyToOutputDirectory=Never')
    #ENDIF
  #ENDIF
#ENDAT
