
PROGRAM _INIT
	SetTemperature := 35;
END_PROGRAM

PROGRAM _CYCLIC
	(*
		Using FUNCTION block MTBasicsPT1() TO
		implement a 1st order delay element (PT1).
	*)
	MTBasicsPT1_0.Enable := 1;
	MTBasicsPT1_0.Gain := 1;
	MTBasicsPT1_0.TimeConstant := 1;
	MTBasicsPT1_0.In := INT_TO_REAL(SetTemperature);
	
	MTBasicsPT1_0();
	
	CurrentTemperature := REAL_TO_INT(MTBasicsPT1_0.Out);
	
	(*
		generate saw tooth signal for further usage of TM641 exercises
		
	*)
	aiTankLevel := aiTankLevel + 1;
	
END_PROGRAM