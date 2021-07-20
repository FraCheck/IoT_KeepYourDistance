#include "KeepYourDistance.h"
#include "printf.h"
#define NEW_PRINTF_SEMANTICS

configuration KeepYourDistanceAppC {}
implementation {
	components MainC, KeepYourDistanceC as App;
	components new AMSenderC(AM_SEND_MSG);
	components new AMReceiverC(AM_SEND_MSG);
	components new TimerMilliC();
	components ActiveMessageC;
	components PrintfC;
	components SerialStartC;
	
	App.Boot -> MainC.Boot;
  
	App.Receive -> AMReceiverC;
	App.AMSend -> AMSenderC;
	App.AMControl -> ActiveMessageC;
	App.Timer1 -> TimerMilliC;
	App.Packet -> AMSenderC;
}

