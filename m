Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: sys_execve problem
Date: Fri, 5 Jul 2002 09:15:20 -0700
Message-ID: <01c501c2243f$2951c700$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020705161520.w8xnwjnOVRYpZ-iIERFn4NHMig6cZNiW-kobuC754Ws@z>

Hey guys. I have compiled 2.4.19-ac1 from the CVS with the linux_2_4 tag for
my NEC Osprey board (NEC VR4181) It boots fine and stuff, but doesn't load
init. I've confirmed with simple print statements that do_execve is
returning a 0 at the point in fs/exec.c where it says "/* execve success */"
and yet init doesn't load. The system just sits there. I see on a scope that
my timer interrupt is firing every 10 ms and the serial console responds
properly. It echos characters and stops the echo when it receives a ctrl-S
and resumes it on ctrl-Q. Obviously this is the last little part of the
kernel to work though here. Any ideas?

Steve
