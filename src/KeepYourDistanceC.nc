
#include "Timer.h"
#include "KeepYourDistance.h"
#include "printf.h"

#define MOTES 7
#define BROADCAST_FREQUENCY 500
#define PROXIMIY_CHECK_FREQUENCY 800
#define MESSAGES_COUNT_ALERT 10
module KeepYourDistanceC @safe() {
  uses {
    interface Boot;
    interface Receive;
	interface AMSend;
    interface Timer<TMilli> as Timer1;
	interface Timer<TMilli> as Timer2;
    interface SplitControl as AMControl;
    interface Packet;
  }
}
implementation {
	message_t packet;
	bool locked;
	
	/* Initialization of variables */
	
	// 7 total motes, 6 neighbours + 1 current mote, not to be incremented
	int neighbouring_motes[MOTES] = {0, 0, 0, 0, 0, 0};
	int neighbouring_motes_prev[MOTES] = {0, 0, 0, 0, 0, 0, 0};
	
	int i = 0;
	
	event void Boot.booted() {
		call AMControl.start();
	}

	event void AMControl.startDone(error_t err) {
		if (err == SUCCESS) {
			call Timer1.startPeriodic(BROADCAST_FREQUENCY);
			call Timer2.startPeriodic(PROXIMIY_CHECK_FREQUENCY);
		}
		else {
			call AMControl.start();
		}
	}

	event void AMControl.stopDone(error_t err) {
		// Do nothing
	}

	event message_t* Receive.receive(message_t* bufPtr, void* payload, uint8_t len) {
		dbg("KeepYourDistanceC", "Received packet of length %hhu.\n", len);
		if (len != sizeof(keep_your_distance_msg_t)) {return bufPtr;}
		else {
			keep_your_distance_msg_t* kyd = (keep_your_distance_msg_t*)payload;
			
			// Set a threshold to stop incrementing the counter if is already greater than MESSAGES_COUNT_ALERT(=10)
			if (neighbouring_motes[kyd->sender_id - 1] > MESSAGES_COUNT_ALERT+100)
				neighbouring_motes[kyd->sender_id - 1] = MESSAGES_COUNT_ALERT;
			
			neighbouring_motes[kyd->sender_id - 1]++;
			
			if(neighbouring_motes[kyd->sender_id - 1] < MESSAGES_COUNT_ALERT){
				printf("Mote %d: Message received by mote %d, new message count for this mote: %d\n", TOS_NODE_ID, kyd->sender_id, neighbouring_motes[kyd->sender_id - 1]);
				printfflush();
			}
			
			if(neighbouring_motes[kyd->sender_id - 1] == MESSAGES_COUNT_ALERT){
				// ALERT, MOTE TOO CLOSE
				printf("Mote %d is too close, %d message reached!\n", kyd->sender_id, MESSAGES_COUNT_ALERT);
				printfflush();
				
				//	Let's generate only 1 Alert message for the 2 motes
				if(TOS_NODE_ID < kyd->sender_id){
					printf("Mote %d and %d have been too close for the past 5 seconds: ALERT\n", TOS_NODE_ID, kyd->sender_id);
					printfflush();
				}
			}
			return bufPtr;
		}
	}

	event void AMSend.sendDone(message_t* bufPtr, error_t error) {
		if (&packet == bufPtr) {
			locked = FALSE;
		}
	}
	
	event void Timer1.fired() {	// Message Broadcaster
		/*
		printf("Mote %d: Timer1 [Broadcaster] fired\n", TOS_NODE_ID);
		printfflush()
		*/
		
		if(!locked)
		{
			keep_your_distance_msg_t* kyd = (keep_your_distance_msg_t*)call Packet.getPayload(&packet, sizeof(keep_your_distance_msg_t));
			if (kyd == NULL) {
				return;
			}
			
			kyd->sender_id = TOS_NODE_ID;
			
			if (call AMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(keep_your_distance_msg_t)) == SUCCESS) {
				dbg("KeepYourDistanceC", "KeepYourDistanceC: packet sent.\n");	
				locked = TRUE;
			}
		}else
			return;
	}
	
	event void Timer2.fired(){
		/*
		printf("Mote %d: Timer2 [Proximity] fired\n", TOS_NODE_ID);
		printfflush();
		*/
		
		for(i=0; i<MOTES; i++){
			if((neighbouring_motes[i] == neighbouring_motes_prev[i]) && neighbouring_motes[i]!=0)	//	If Mote i is not to close anymore...
			{
			//	Reset the counter to 0
			
				printf("Mote %d: Mote %d is gone, resetting the counter to 0...\n", TOS_NODE_ID, i+1);
				
				neighbouring_motes[i] = 0;
			}
			//	Save the state
			neighbouring_motes_prev[i] = neighbouring_motes[i];
		}
	}
}