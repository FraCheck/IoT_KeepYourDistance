
#include "Timer.h"
#include "KeepYourDistance.h"
#include "printf.h"

module KeepYourDistanceC @safe() {
  uses {
    interface Boot;
    interface Receive;
	interface AMSend;
    interface Timer<TMilli> as Timer1;
    interface SplitControl as AMControl;
    interface Packet;
  }
}
implementation {
	message_t packet;
	bool locked;
	
	/* Initialization of variables */
	
	// 7 total motes, 6 neighbours + 1 current mote, not to be incremented
	int neighbouring_motes[6] = {0,0,0,0,0,0};
	int neighbouring_motes_prev[6] = {0,0,0,0,0,0};
	
	event void Boot.booted() {
		call AMControl.start();
	}

	event void AMControl.startDone(error_t err) {
		if (err == SUCCESS) {
			/* Assign frequency to the broadcaster timer */
			uint32_t frequency = 500; // [ms]
			
			printf("Example of how to do a printf\n");
			printfflush();
			
			call Timer1.startPeriodic(frequency);
		}
		else {
			call AMControl.start();
		}
	}

	event void AMControl.stopDone(error_t err) {
		// do nothing
	}
  
	event void Timer1.fired() {
		printf("KeepYourDistanceC: Timer1[Broadcaster] fired\n");
		printfflush();
		if (!locked)
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
		}
	}

	event message_t* Receive.receive(message_t* bufPtr, void* payload, uint8_t len) {
		dbg("KeepYourDistanceC", "Received packet of length %hhu.\n", len);
		if (len != sizeof(keep_your_distance_msg_t)) {return bufPtr;}
		else {
			keep_your_distance_msg_t* kyd = (keep_your_distance_msg_t*)payload;
			/* LOGIC UPON MESSAGE RECEIVAL GOES HERE */
			neighbouring_motes[kyd->sender_id - 1]++;
			
			printf("KeepYourDistanceC: Message received by mote %d, new message count for this mote: %d\n", kyd->sender_id, neighbouring_motes[kyd->sender_id - 1]);
			printfflush();
			
			if(neighbouring_motes[kyd->sender_id - 1] >= 10){
				// ALERT, MOTE TOO CLOSE
				printf("KeepYourDistanceC", "KeepYourDistanceC: Mote %d is too close, 10 message reached: ALERT\n", kyd->sender_id);
				printfflush();
			}
			return bufPtr;
		}
	}

	event void AMSend.sendDone(message_t* bufPtr, error_t error) {
		if (&packet == bufPtr) {
			locked = FALSE;
		}
	}
}




