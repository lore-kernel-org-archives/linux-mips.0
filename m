Message-ID: <00fe01c140b4$ad3f9200$cd22690a@huawei.com>
Reply-To: "Shaolin Zhang" <zhangshaolin@huawei.com>
From: "Shaolin Zhang" <zhangshaolin@huawei.com>
Subject: kgdb with linux-mips problem
Date: Wed, 19 Sep 2001 10:42:08 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: Ernest Jih <ernest.jih@idt.com>, "\"recc stone\"" <renwei@huawei.com>
Message-ID: <20010919024208.W_44NbfIWW580kgf4_reBNHI8DUnQ5yA9ZZyFh8d1mg@z>

Hello ,

  Now we have some problems in using kgdb to debug the Linux-mips kernel on IDT 79s334A board.

1.I enabled the kernel startup option kgdb=on to debug the kernel setup.
  At first, the gdb on host pc connected to the target boards correctly.
  Then I use a few "n"(Next) command to debug the kernel, but the kernel
seems
 to run out of my hands, as if I had executed some "c" command.
  I use "set debug remote 1"  command to see the packets gdb send&receive:
  and find :
   the gdb send a "c" packet to the stub at the end of packet sequence.

  I guess that the gdb on the host pc send some wrong command , or it can't
get right info
  to debug?


2.I want to debug some init_module function in module , like this :

int init_module(void)
{
    breakpoint(); // use the breakpoint function in kernel to get a break.
    my_functions();
}

When I insmod this module, it through exception 9 (breakpoint), then I run
"bt"
command in gdb, but this time gdb report "can't find the start of function
0x....".
Is this a gdb problem or gdb stub problem? BTW, when I first bootup the
kernel
and connect the gdb&stub ,the sample problem happened.
