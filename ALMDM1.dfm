object DMALM: TDMALM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 142
  Top = 34
  Height = 822
  Width = 1255
  object cdsFPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1172
    Top = 511
  end
  object dsArti: TwwDataSource
    DataSet = cdsArti
    Left = 222
    Top = 436
  end
  object cdsCCost: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCCost'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'CCOSID'#9'###'#9'T'#9'T')
    ValidateWithMask = True
    Left = 276
    Top = 10
  end
  object dsCCost: TwwDataSource
    DataSet = cdsCCost
    Left = 276
    Top = 53
  end
  object cdsCIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCia'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'CIAID'#9'##'#9'T'#9'T')
    ValidateWithMask = True
    Left = 206
    Top = 10
  end
  object dsCIA: TwwDataSource
    DataSet = cdsCIA
    Left = 206
    Top = 53
  end
  object cdsGArti: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 806
    Top = 394
  end
  object dsGArti: TwwDataSource
    DataSet = cdsGArti
    Left = 806
    Top = 436
  end
  object cdsUMed: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUMed'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 633
    Top = 117
  end
  object dsUMed: TwwDataSource
    DataSet = cdsUMed
    Left = 633
    Top = 135
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'prvUsers'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1147
    Top = 114
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 1150
    Top = 132
  end
  object cdsTMoneda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMoneda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 383
    Top = 294
  end
  object dsTMoneda: TwwDataSource
    DataSet = cdsTMoneda
    Left = 383
    Top = 338
  end
  object cdsSQL: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOG'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 914
    Top = 394
  end
  object dsSQL: TwwDataSource
    DataSet = cdsSQL
    Left = 914
    Top = 436
  end
  object cdsLEntrega: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLEntrega'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 346
    Top = 10
  end
  object dsLEntrega: TwwDataSource
    DataSet = cdsLEntrega
    Left = 346
    Top = 53
  end
  object cdsArtPend: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 0
    Params = <>
    ProviderName = 'prvArtPend'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 825
    Top = 486
  end
  object dsArtPend: TwwDataSource
    DataSet = cdsArtPend
    Left = 828
    Top = 528
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 669
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 64
    Top = 712
  end
  object cdsProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 346
    Top = 204
  end
  object dsProv: TwwDataSource
    DataSet = cdsProv
    Left = 344
    Top = 245
  end
  object cdsDOrdComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDOrdComp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1152
    Top = 204
  end
  object dsDOrdComp: TwwDataSource
    DataSet = cdsDOrdComp
    Left = 1152
    Top = 245
  end
  object cdsFAB: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 706
    Top = 117
  end
  object dsFAB: TwwDataSource
    DataSet = cdsFAB
    Left = 709
    Top = 135
  end
  object dsEARTI: TwwDataSource
    DataSet = cdsEARTI
    Left = 206
    Top = 135
  end
  object cdsClnArti: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 828
    Top = 294
  end
  object dsClnArti: TwwDataSource
    DataSet = cdsClnArti
    Left = 828
    Top = 338
  end
  object cdsQARTI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 143
    Top = 10
  end
  object dsQARTI: TwwDataSource
    DataSet = cdsQARTI
    Left = 143
    Top = 53
  end
  object cdsNIS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNISA'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 276
    Top = 204
  end
  object dsNIS: TwwDataSource
    DataSet = cdsNIS
    Left = 275
    Top = 245
  end
  object dsKDX: TwwDataSource
    DataSet = cdsKDX
    Left = 768
    Top = 135
  end
  object cdsALM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvALM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 698
    Top = 10
  end
  object dsALM: TwwDataSource
    DataSet = cdsALM
    Left = 701
    Top = 53
  end
  object cdsTDOC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 775
    Top = 294
  end
  object dsTDOC: TwwDataSource
    DataSet = cdsTDOC
    Left = 775
    Top = 338
  end
  object cdsTRAN: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRAN'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 10
  end
  object dsTRAN: TwwDataSource
    DataSet = cdsTRAN
    Left = 64
    Top = 53
  end
  object cdsSTK: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSTK'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 522
    Top = 394
  end
  object dsSTK: TwwDataSource
    DataSet = cdsSTK
    Left = 522
    Top = 436
  end
  object cdsCNS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCNS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 347
    Top = 394
  end
  object dsCNS: TwwDataSource
    DataSet = cdsCNS
    Left = 347
    Top = 436
  end
  object cdsEUNMED: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSEQMED'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 934
    Top = 117
  end
  object dsEUNMED: TwwDataSource
    DataSet = cdsEUNMED
    Left = 934
    Top = 135
  end
  object dsNIA: TwwDataSource
    DataSet = cdsNia
    Left = 563
    Top = 135
  end
  object cdsTDNISA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDNISA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1148
    Top = 12
  end
  object dsTDNISA: TwwDataSource
    DataSet = cdsTDNISA
    Left = 1151
    Top = 53
  end
  object cdsOCNIA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOCNIA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 719
    Top = 294
  end
  object dsOCNIA: TwwDataSource
    DataSet = cdsOCNIA
    Left = 722
    Top = 338
  end
  object cdsLKTRAN: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRAN'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 415
    Top = 117
  end
  object dsLKTRAN: TwwDataSource
    DataSet = cdsLKTRAN
    Left = 418
    Top = 135
  end
  object cdsCierre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCierre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 348
    Top = 117
  end
  object dsCierre: TwwDataSource
    DataSet = cdsCierre
    Left = 351
    Top = 135
  end
  object cdsDOCATT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDOCAtt'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 176
    Top = 394
  end
  object dsDOCATT: TwwDataSource
    DataSet = cdsDOCATT
    Left = 176
    Top = 436
  end
  object cdsPRIO: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPRIO'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1119
    Top = 511
  end
  object dsPRIO: TwwDataSource
    DataSet = cdsPRIO
    Left = 65445
    Top = 209
  end
  object cdsArti: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArti'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 224
    Top = 394
  end
  object cdsEARTI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEArti'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 206
    Top = 117
  end
  object cdsKDX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvKDX'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ControlType.Strings = (
      'FLAGVAR;CheckBox;*; ')
    ValidateWithMask = True
    Left = 776
    Top = 117
  end
  object cdsTMP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOG'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 491
    Top = 117
  end
  object dsTMP: TwwDataSource
    DataSet = cdsTMP
    Left = 491
    Top = 135
  end
  object cdsLOC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 143
    Top = 204
  end
  object dsLOC: TwwDataSource
    DataSet = cdsLOC
    Left = 143
    Top = 245
  end
  object cdsLKALM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvALM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 554
    Top = 295
  end
  object dsClient: TwwDataSource
    DataSet = cdsClient
    Left = 631
    Top = 58
  end
  object cdsClient: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvClient'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'VBUENO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 631
    Top = 10
  end
  object cdsConceptoAlm: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvConceptoAlm'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 283
    Top = 394
  end
  object dsConceptoAlm: TwwDataSource
    DataSet = cdsConceptoAlm
    Left = 283
    Top = 436
  end
  object cdsLKLOC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLOC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 609
    Top = 295
  end
  object dsLKLOC: TwwDataSource
    DataSet = cdsLKLOC
    Left = 609
    Top = 339
  end
  object dsLKALM: TwwDataSource
    DataSet = cdsLKALM
    Left = 554
    Top = 339
  end
  object cdsDOCATT2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDOCAtt2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1088
    Top = 204
  end
  object dsDOCATT2: TwwDataSource
    DataSet = cdsDOCATT2
    Left = 1088
    Top = 245
  end
  object cdsFAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1055
    Top = 294
  end
  object dsFAM: TwwDataSource
    DataSet = cdsFAM
    Left = 1055
    Top = 338
  end
  object cdsSUBFAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSUBFAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 254
    Top = 294
  end
  object dsSUBFAM: TwwDataSource
    DataSet = cdsSUBFAM
    Left = 254
    Top = 338
  end
  object cdsTINID: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTINID'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1008
    Top = 204
  end
  object dsTINID: TwwDataSource
    DataSet = cdsTINID
    Left = 1008
    Top = 245
  end
  object cdsPCUENTA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPCUENTA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 206
    Top = 204
  end
  object dsPCUENTA: TwwDataSource
    DataSet = cdsPCUENTA
    Left = 206
    Top = 245
  end
  object cdsKDXTemp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvKDXTemp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 856
    Top = 117
  end
  object dsKDXTemp: TwwDataSource
    DataSet = cdsKDXTemp
    Left = 851
    Top = 135
  end
  object cdsSaldos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSaldos'
    RemoteServer = DCOM1
    OnCalcFields = cdsSaldosCalcFields
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 563
    Top = 10
  end
  object dsSaldos: TwwDataSource
    DataSet = cdsSaldos
    Left = 563
    Top = 53
  end
  object cdsMAlmCab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMAlmCab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 420
    Top = 10
  end
  object dsMAlmCab: TwwDataSource
    DataSet = cdsMAlmCab
    Left = 420
    Top = 53
  end
  object cdsMAlmDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMAlmDet'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 491
    Top = 10
  end
  object dsMAlmDet: TwwDataSource
    DataSet = cdsMAlmDet
    Left = 491
    Top = 53
  end
  object cdsOrdComp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOrdComp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 400
    Top = 394
  end
  object dsOrdComp: TwwDataSource
    DataSet = cdsOrdComp
    Left = 400
    Top = 436
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUsuarios'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1088
    Top = 10
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 143
    Top = 117
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 445
    Top = 294
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 751
    Top = 394
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 1088
    Top = 53
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 143
    Top = 135
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 445
    Top = 338
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 751
    Top = 436
  end
  object dsAjuSal: TwwDataSource
    DataSet = cdsAjuSal
    Left = 591
    Top = 528
  end
  object cdsUbicacion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUbicacion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1121
    Top = 703
  end
  object cdsAjuSal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAjuSal'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 591
    Top = 486
  end
  object cdsStockVal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvStockVal'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 573
    Top = 394
  end
  object dsStockVal: TwwDataSource
    DataSet = cdsStockVal
    Left = 576
    Top = 436
  end
  object cdsTipCam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTIPCAM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 294
  end
  object dsTipCam: TwwDataSource
    DataSet = cdsTipCam
    Left = 64
    Top = 338
  end
  object cdsVeriClon: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvVeriClon'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 122
    Top = 294
  end
  object cdsVeriNum: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvVeriNum'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 563
    Top = 204
  end
  object cdsVeriResul: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvVeriResul'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 185
    Top = 294
  end
  object dsVeriNum: TwwDataSource
    DataSet = cdsVeriNum
    Left = 563
    Top = 245
  end
  object dsVeriClon: TwwDataSource
    DataSet = cdsVeriClon
    Left = 122
    Top = 338
  end
  object dsVeriResul: TwwDataSource
    DataSet = cdsVeriResul
    Left = 185
    Top = 338
  end
  object cdsPerALM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPerALM'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 318
    Top = 294
  end
  object dsPerALM: TwwDataSource
    DataSet = cdsPerALM
    Left = 318
    Top = 338
  end
  object cdsTDiario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDiario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 633
    Top = 204
  end
  object dsTDiario: TwwDataSource
    DataSet = cdsTDiario
    Left = 633
    Top = 245
  end
  object cdsTGE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 702
    Top = 204
  end
  object cdsEjecuta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 115
    Top = 394
  end
  object dsTGE: TwwDataSource
    DataSet = cdsTGE
    Left = 705
    Top = 245
  end
  object dsEjecuta: TwwDataSource
    DataSet = cdsEjecuta
    Left = 115
    Top = 436
  end
  object cdsSQL1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 183
    Top = 486
  end
  object dsSQL1: TwwDataSource
    DataSet = cdsSQL1
    Left = 183
    Top = 528
  end
  object cdsAsientoS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 852
    Top = 394
  end
  object dsAsientoS: TwwDataSource
    DataSet = cdsAsientoS
    Left = 852
    Top = 436
  end
  object cdsAsiento: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAsiento'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 293
    Top = 486
  end
  object cdsDAsiento: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDAsiento'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 417
    Top = 486
  end
  object dsAsiento: TwwDataSource
    DataSet = cdsAsiento
    Left = 293
    Top = 528
  end
  object dsDAsiento: TwwDataSource
    DataSet = cdsDAsiento
    Left = 417
    Top = 528
  end
  object cdsPeriodo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPeriodo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 482
    Top = 486
  end
  object dsPeriodo: TwwDataSource
    DataSet = cdsPeriodo
    Left = 482
    Top = 528
  end
  object cdsCnt300: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCnt300'
    RemoteServer = DCOM1
    OnReconcileError = cdsCnt300ReconcileError
    PictureMasks.Strings = (
      'DESRUC'#9'[#][#][#][#][#][#][#][#][#][#][#]'#9'T'#9'F'
      'TRANRUC'#9'[#][#][#][#][#][#][#][#][#][#][#]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 663
    Top = 295
  end
  object cdsCnt301: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCnt301'
    RemoteServer = DCOM1
    OnReconcileError = cdsCnt301ReconcileError
    ValidateWithMask = True
    Left = 500
    Top = 295
  end
  object dsCnt300: TwwDataSource
    DataSet = cdsCnt300
    Left = 663
    Top = 339
  end
  object dsCnt301: TwwDataSource
    DataSet = cdsCnt301
    Left = 500
    Top = 339
  end
  object cdsSalAlm: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSalAlm'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 633
    Top = 394
  end
  object dsSalAlm: TwwDataSource
    DataSet = cdsSalAlm
    Left = 633
    Top = 436
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 761
    Top = 486
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 761
    Top = 528
  end
  object cdsArtiStk: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvArtiStk'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 682
    Top = 579
  end
  object dsArtiStk: TwwDataSource
    DataSet = cdsArtiStk
    Left = 683
    Top = 620
  end
  object cdsNia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNISA'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 563
    Top = 117
  end
  object cdsLKTIN: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTINID'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 887
    Top = 486
  end
  object dsLKTIN: TwwDataSource
    DataSet = cdsLKTIN
    Left = 887
    Top = 528
  end
  object cdsAPNIS: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAPNIS'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAGVAR;CheckBox;S;N')
    PictureMasks.Strings = (
      'CNTG'#9'*12[#][.*4[#]]'#9'T'#9'T'
      'CNTU'#9'*12[#][.*4[#]]'#9'T'#9'T')
    ValidateWithMask = True
    Left = 737
    Top = 579
  end
  object dsAPNIS: TwwDataSource
    DataSet = cdsAPNIS
    Left = 737
    Top = 619
  end
  object cdsReqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReqs'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAGVAR;CheckBox;*;')
    ValidateWithMask = True
    Left = 535
    Top = 486
  end
  object dsReqs: TwwDataSource
    DataSet = cdsReqs
    Left = 535
    Top = 528
  end
  object cdsDReqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDReqs'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 643
    Top = 486
  end
  object dsDReqs: TwwDataSource
    DataSet = cdsDReqs
    Left = 643
    Top = 528
  end
  object cdsTipSol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipSol'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 699
    Top = 486
  end
  object dsTipSol: TwwDataSource
    DataSet = cdsTipSol
    Left = 699
    Top = 528
  end
  object cdsDetMov: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetMov'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1006
    Top = 10
  end
  object dsDetMov: TwwDataSource
    DataSet = cdsDetMov
    Left = 1006
    Top = 53
  end
  object cdsDetMovCco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetMovCCo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 117
  end
  object dsDetMovCco: TwwDataSource
    DataSet = cdsDetMovCco
    Left = 64
    Top = 135
  end
  object cdsTRqs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRqs'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'TRQSID'#9'###'#9'T'#9'T')
    ValidateWithMask = True
    Left = 276
    Top = 117
  end
  object dsTRqs: TwwDataSource
    DataSet = cdsTRqs
    Left = 276
    Top = 135
  end
  object cdsConsumo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvConsumo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 688
    Top = 394
  end
  object dsConsumo: TwwDataSource
    DataSet = cdsConsumo
    Left = 688
    Top = 436
  end
  object cdsObra: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'OBRAID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OBRADES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBRAABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'OBRARESP'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBRANUM'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'OBRAFCHA'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvObra'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 64
    Top = 394
  end
  object dsObra: TwwDataSource
    DataSet = cdsObra
    Left = 64
    Top = 436
  end
  object cdsMovCNT1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMovCNT'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 771
    Top = 10
  end
  object cdsNivel: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNivel'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1006
    Top = 117
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 160
    Top = 669
  end
  object cdsMovCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMovCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 124
    Top = 486
  end
  object dsMovCxP: TwwDataSource
    DataSet = cdsMovCxP
    Left = 124
    Top = 528
  end
  object dsMovCNT1: TwwDataSource
    DataSet = cdsMovCNT1
    Left = 774
    Top = 53
  end
  object dsNivel: TwwDataSource
    DataSet = cdsNivel
    Left = 1006
    Top = 135
  end
  object dsQry2: TwwDataSource
    DataSet = cdsQry2
    Left = 160
    Top = 712
  end
  object dsCabPre: TwwDataSource
    DataSet = cdsCabPre
    Left = 771
    Top = 245
  end
  object cdsCabPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCabPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 771
    Top = 204
  end
  object cdsNivelPresu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNivelPresu'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 890
    Top = 294
  end
  object dsNivelPresu: TwwDataSource
    DataSet = cdsNivelPresu
    Left = 890
    Top = 338
  end
  object cdsTipPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 967
    Top = 394
  end
  object dsTipPre: TwwDataSource
    DataSet = cdsTipPre
    Left = 967
    Top = 436
  end
  object dsParPre: TwwDataSource
    DataSet = cdsParPre
    Left = 848
    Top = 619
  end
  object cdsParPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvParPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 848
    Top = 579
  end
  object dsDetPre: TwwDataSource
    DataSet = cdsDetPre
    Left = 237
    Top = 528
  end
  object cdsDetPre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetPre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 237
    Top = 486
  end
  object cdsParaRepo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvParaRepo'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ValidateWithMask = True
    Left = 467
    Top = 394
  end
  object dsParaRepo: TwwDataSource
    DataSet = cdsParaRepo
    Left = 467
    Top = 436
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1121
    Top = 599
  end
  object cdsDeltaSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 623
    Top = 579
  end
  object dsDeltaSet: TwwDataSource
    DataSet = cdsDeltaSet
    Left = 625
    Top = 620
  end
  object cdsMovFac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMovFac'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 353
    Top = 486
  end
  object cdsGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGuia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 569
    Top = 579
  end
  object dsGuia: TwwDataSource
    DataSet = cdsGuia
    Left = 569
    Top = 620
  end
  object dsMovFac: TwwDataSource
    DataSet = cdsMovFac
    Left = 353
    Top = 528
  end
  object dsDetGuia: TwwDataSource
    DataSet = cdsDetGuia
    Left = 515
    Top = 619
  end
  object cdsDetGuia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetGuia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 515
    Top = 579
  end
  object dsDetFac: TwwDataSource
    AutoEdit = False
    DataSet = cdsDetFac
    Left = 418
    Top = 245
  end
  object cdsDetFac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetFac'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 420
    Top = 204
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 257
    Top = 669
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 257
    Top = 712
  end
  object cdsHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHojaT'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 855
    Top = 10
  end
  object dsHojaT: TwwDataSource
    DataSet = cdsHojaT
    Left = 858
    Top = 53
  end
  object cdsDHojaT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDHojat'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1088
    Top = 117
  end
  object dsDHojaT: TwwDataSource
    DataSet = cdsDHojaT
    Left = 1088
    Top = 135
  end
  object cdsUltTGE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1121
    Top = 555
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 114
    Top = 669
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 354
    Top = 669
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 354
    Top = 712
  end
  object cdsKDXSerie: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKDXSerie'
    RemoteServer = DCOM1
    OnReconcileError = cdsKDXSerieReconcileError
    ControlType.Strings = (
      'ENTREGADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 959
    Top = 579
  end
  object dsKDXSerie: TwwDataSource
    DataSet = cdsKDXSerie
    Left = 960
    Top = 620
  end
  object cdsPadre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPadre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 486
  end
  object cdsHijo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvHijo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 64
    Top = 579
  end
  object cdsNieto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNieto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 114
    Top = 579
  end
  object cdsSobrino: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSobrino'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 171
    Top = 579
  end
  object dsPadre: TwwDataSource
    DataSet = cdsPadre
    Left = 64
    Top = 528
  end
  object dsHijo: TwwDataSource
    DataSet = cdsHijo
    Left = 63
    Top = 620
  end
  object dsNieto: TwwDataSource
    DataSet = cdsNieto
    Left = 112
    Top = 620
  end
  object dsSobrino: TwwDataSource
    DataSet = cdsSobrino
    Left = 170
    Top = 620
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 307
    Top = 669
  end
  object dsQry5: TwwDataSource
    DataSet = cdsQry5
    Left = 307
    Top = 712
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 209
    Top = 669
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 209
    Top = 712
  end
  object cdsMovCNT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 950
    Top = 486
  end
  object dsMovCNT: TwwDataSource
    DataSet = cdsMovCNT
    Left = 950
    Top = 528
  end
  object cdsCInventario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCInventario'
    RemoteServer = DCOM1
    OnReconcileError = cdsCInventarioReconcileError
    ValidateWithMask = True
    Left = 238
    Top = 579
  end
  object dsCInventario: TwwDataSource
    DataSet = cdsCInventario
    Left = 237
    Top = 620
  end
  object dsDInventario: TwwDataSource
    DataSet = cdsDInventario
    Left = 317
    Top = 620
  end
  object cdsDInventario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCInventario'
    RemoteServer = DCOM1
    OnReconcileError = cdsDInventarioReconcileError
    ValidateWithMask = True
    Left = 316
    Top = 579
  end
  object cdsReqAut: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvreqAut'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 454
    Top = 579
  end
  object dsReqAut: TwwDataSource
    DataSet = cdsReqAut
    Left = 453
    Top = 620
  end
  object cdsStkMto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1121
    Top = 647
  end
  object cdsPais: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1017
    Top = 394
  end
  object dsPais: TwwDataSource
    DataSet = cdsPais
    Left = 1017
    Top = 436
  end
  object cdsProvinc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 491
    Top = 204
  end
  object dsProvinc: TwwDataSource
    DataSet = cdsProvinc
    Left = 493
    Top = 245
  end
  object cdsDpto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 708
    Top = 669
  end
  object dsDpto: TwwDataSource
    DataSet = cdsDpto
    Left = 711
    Top = 712
  end
  object cdsDistrito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 856
    Top = 204
  end
  object dsDistrito: TwwDataSource
    DataSet = cdsDistrito
    Left = 856
    Top = 245
  end
  object cdsSecEco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 765
    Top = 669
  end
  object dsSecEco: TwwDataSource
    DataSet = cdsSecEco
    Left = 765
    Top = 712
  end
  object cdsGiro: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1058
    Top = 394
  end
  object dsGiro: TwwDataSource
    DataSet = cdsGiro
    Left = 1058
    Top = 436
  end
  object cdsClasif: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 902
    Top = 579
  end
  object dsClasif: TwwDataSource
    DataSet = cdsClasif
    Left = 902
    Top = 620
  end
  object cdsClAux: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 660
    Top = 669
  end
  object dsClAux: TwwDataSource
    DataSet = cdsClAux
    Left = 662
    Top = 712
  end
  object cdsTipPer: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1156
    Top = 394
  end
  object dsTipPer: TwwDataSource
    DataSet = cdsTipPer
    Left = 1158
    Top = 436
  end
  object cdsTipProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 792
    Top = 578
  end
  object dsTipProv: TwwDataSource
    DataSet = cdsTipProv
    Left = 792
    Top = 619
  end
  object cdsStockErr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1014
    Top = 485
  end
  object dsStockErr: TwwDataSource
    DataSet = cdsStockErr
    Left = 1015
    Top = 527
  end
  object cdsStock: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1105
    Top = 394
  end
  object dsStock: TwwDataSource
    DataSet = cdsStock
    Left = 1105
    Top = 436
  end
  object cdsStockAct: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 390
    Top = 579
  end
  object dsStockAct: TwwDataSource
    DataSet = cdsStockAct
    Left = 390
    Top = 620
  end
  object cdsProv2: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'prvObra'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 497
    Top = 669
  end
  object dsProv2: TwwDataSource
    DataSet = cdsProv2
    Left = 497
    Top = 712
  end
  object cdsMarca: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 607
    Top = 669
  end
  object cdsTipArt: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 554
    Top = 669
  end
  object dsMarca: TwwDataSource
    DataSet = cdsMarca
    Left = 606
    Top = 712
  end
  object dsTipArt: TwwDataSource
    DataSet = cdsTipArt
    Left = 556
    Top = 712
  end
  object cdsQry8: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 403
    Top = 669
  end
  object dsQry8: TwwDataSource
    DataSet = cdsQry8
    Left = 403
    Top = 712
  end
  object cdsNIT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 451
    Top = 669
  end
  object dsNIT: TwwDataSource
    DataSet = cdsNIT
    Left = 451
    Top = 712
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 1170
    Top = 586
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1166
    Top = 645
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1170
    Top = 708
  end
  object cdsGuiaRemision: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1118
    Top = 294
  end
  object dsGuiaRemision: TwwDataSource
    DataSet = cdsGuiaRemision
    Left = 1118
    Top = 338
  end
  object cdsGuiaRemSalida: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 846
    Top = 669
  end
  object dsGuiaRemSalida: TwwDataSource
    DataSet = cdsGuiaRemSalida
    Left = 845
    Top = 712
  end
  object cdsGuiaRemTraslado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 980
    Top = 294
  end
  object dsGuiaRemTraslado: TwwDataSource
    DataSet = cdsGuiaRemTraslado
    Left = 980
    Top = 338
  end
  object cdsGuiaRemRequerimiento: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 966
    Top = 669
  end
  object DCOM1: TSocketConnection
    ServerName = 'DMALMSrv.SrvDMALM'
    Left = 16
    Top = 7
  end
  object cdsSCLASE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    Left = 934
    Top = 10
  end
  object dsSCLASE: TDataSource
    DataSet = cdsSCLASE
    Left = 934
    Top = 53
  end
  object cdsCLASE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 934
    Top = 204
  end
  object dsGuiaRemRequerimiento: TwwDataSource
    DataSet = cdsGuiaRemRequerimiento
    Left = 966
    Top = 711
  end
  object dsCLASE: TwwDataSource
    DataSet = cdsCLASE
    Left = 934
    Top = 245
  end
  object dsKDXNSal: TwwDataSource
    DataSet = cdsKDXNSal
    Left = 63
    Top = 245
  end
  object cdsKDXNSal: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvKDX'
    RemoteServer = DCOM1
    OnReconcileError = cdsParaRepoReconcileError
    ControlType.Strings = (
      'FLAGVAR;CheckBox;*; ')
    ValidateWithMask = True
    Left = 64
    Top = 197
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 1026
    Top = 579
  end
  object dsQry7: TwwDataSource
    DataSet = cdsQry7
    Left = 1026
    Top = 622
  end
  object cdsQry9: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 1071
    Top = 579
  end
  object dsQry9: TwwDataSource
    DataSet = cdsQry9
    Left = 1071
    Top = 622
  end
  object cdsQry10: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAG;CheckBox;S;N')
    ValidateWithMask = True
    Left = 1055
    Top = 666
  end
  object dsQry10: TwwDataSource
    DataSet = cdsQry10
    Left = 1055
    Top = 709
  end
end
