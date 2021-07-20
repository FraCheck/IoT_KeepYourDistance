#ifndef KEEP_YOUR_DISTANCE_H
#define KEEP_YOUR_DISTANCE_H

typedef nx_struct keep_your_distance_msg {
  nx_uint16_t sender_id;
} keep_your_distance_msg_t;

enum {
  AM_SEND_MSG = 6,
};

#endif
