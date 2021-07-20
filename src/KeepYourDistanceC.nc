
#include "Timer.h"
#include "KeepYourDistance.h"
#include "printf.h"

module KeepYourDistance @safe() {
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
  
  
	event void Boot.booted() {
		call AMControl.start();
	}

	event void AMControl.startDone(error_t err) {
		if (err == SUCCESS) {
			/* Assign frequency to the broadcaster timer */
			uint32_t frequency = 500; // [ms]
			
			//printf("Example of how to do a printf",frequency);
			//printfflush();
			
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
		dbg("KeepYourDistanceC", "KeepYourDistanceC: Timer1[Broadcaster] fired");
		if (locked) {
			return;
		}
		else {
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
			
			return bufPtr;
		}
	}

  event void AMSend.sendDone(message_t* bufPtr, error_t error) {
    if (&packet == bufPtr) {
      locked = FALSE;
    }
  }
}




