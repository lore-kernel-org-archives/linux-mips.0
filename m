Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: sys_execve problem
Date: Fri, 5 Jul 2002 16:57:27 -0700
Message-ID: <01da01c2247f$b80c5e20$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <006401c2247d$3356e580$4c00a8c0@prefect>
Sender: owner-linux-mips@oss.sgi.com
To: "'Bradley D. LaRonde'" <brad@ltc.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020705235727.cbR1hSTnobLgvKXsBXBIlE5RX9WqezSWwRDFEVT624I@z>

By init do you mean the init_task_union? That's in the data segment and not
static. ld.so is needed but it's also executable. It boots fine under other
kernels. I either have this problem with 2.4.19 or the 2.4.18 problem where
kfree doesn't free any memory and the system eventually runs out of memory
because of the buffer caches. I'd love to get 2.4.19 booting because then I
wouldn't have to mess with a problem with 2.4.16 from SF where the
current->user gets set to 0 somewhere in kernel_thread and crashes in
do_fork. I know the kfree works on 2.4.19 because the system doesn't freeze
up when the rom block driver tries to call fsync_dev in rom_release like it
does on the 2.4.18. (It freezes up in sync_inodes)

I'm about to look for a new job here. :)

Steve

>-----Original Message-----
>From: Bradley D. LaRonde [mailto:brad@ltc.com]
>Sent: Friday, July 05, 2002 4:39 PM
>To: sseeger@stellartec.com
>Cc: linux-mips@oss.sgi.com
>Subject: Re: sys_execve problem
>
>
>Is your init static?  Does it need ld.so?  Is ld.so executable
>(that's a
>tricky one).
>
>Regards,
>Brad
>
>----- Original Message -----
>From: "Steven Seeger" <sseeger@stellartec.com>
>To: <linux-mips@oss.sgi.com>
>Sent: Friday, July 05, 2002 12:15 PM
>Subject: sys_execve problem
>
>
>> Hey guys. I have compiled 2.4.19-ac1 from the CVS with the
>linux_2_4 tag
>for
>> my NEC Osprey board (NEC VR4181) It boots fine and stuff,
>but doesn't load
>> init. I've confirmed with simple print statements that do_execve is
>> returning a 0 at the point in fs/exec.c where it says "/*
>execve success
>*/"
>> and yet init doesn't load. The system just sits there. I see
>on a scope
>that
>> my timer interrupt is firing every 10 ms and the serial
>console responds
>> properly. It echos characters and stops the echo when it
>receives a ctrl-S
>> and resumes it on ctrl-Q. Obviously this is the last little
>part of the
>> kernel to work though here. Any ideas?
>>
>> Steve
>
