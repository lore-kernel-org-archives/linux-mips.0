Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: more on my slab problem
Date: Sat, 6 Jul 2002 15:10:04 -0700
Message-ID: <020001c22539$e23e4310$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20020706221004.s2KYK0zlNCIvW-BxW6TUziihtnkvV8DMhs4yTAAljvY@z>

The page fault is happening in __wake_up_common() On the 3rd time through
the list_for_each() block, a wait_queue_t *curr = list_entry(tmp,
wait_queue_t, task_list); line returns a curr of 0xFFFFFFF8 and it page
faults on the p = curr->task line because obviously that's a bad address.
(page faults on 0xFFFFFFFC)

I'm sorry to write to both lists but neither has a lot of activity and I'm
hoping somebody on one of the lists could help.

Steve
