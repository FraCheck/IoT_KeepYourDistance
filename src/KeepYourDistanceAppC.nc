#include "KeepYourDistance.h"
#define NEW_PRINTF_SEMANTICS
#include "printf.h"

configuration KeepYourDistanceAppC {}
implementation {
	components MainC, KeepYourDistanceC as App;
	components new AMSenderC(AM_RADIO_COUNT_MSG);
	components new AMReceiverC(AM_RADIO_COUNT_MSG);
	components new TimerMilliC();
	components ActiveMessageC;
	components PrintfC;
	components SerialStartC;
  
	App.Boot -> MainC.Boot;
  
	App.Receive -> AMReceiverC;
	App.AMSend -> AMSenderC;
	App.AMControl -> ActiveMessageC;
	App.MilliTimer -> TimerMilliC;
	App.Packet -> AMSenderC;
}


